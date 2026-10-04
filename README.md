# zig-json

Native JSON tools for Zig, with an optional Cottontail adapter for specialized
JavaScript workloads. Zig 0.16.0, MIT licensed, initial 0.1.0 API.

- Typed parsing and compact serialization through a vendored yyjson backend.
- Native document views for extracting a small part of a large document.
- Immutable serialized edit plans: index fields once, replace several values,
  and copy the output once or stream unchanged slices directly to a writer.
- Strict JSON validation, byte preservation outside edits, and explicit ownership.

This is a Zig library with a C backend, not a pure-Zig or SIMD parser. It does
not replace JavaScript's built-in `JSON.parse` or `JSON.stringify`.

## Build and test

```sh
zig build test
zig build test -Doptimize=ReleaseSafe
zig build example
zig build bench -Doptimize=ReleaseFast
```

The default `zig build` installs the runnable example. The core has no network
dependencies: yyjson and the conformance corpus are vendored with licenses and
pinned revisions in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

Add this repository as a Zig package dependency (named `zig_json` below), then
import its exported module in your `build.zig`:

```zig
const dependency = b.dependency("zig_json", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.addImport("zig-json", dependency.module("zig-json"));
```

The module supplies its C include path, yyjson source, and libc dependency.
No C++ compiler, JSC dependency, or separately installed JSON library is needed.

## Typed values

```zig
const json = @import("zig-json");
const State = struct {
    count: u32,
    title: []const u8,
    ready: bool = false,
};

var parsed = try json.parse(State, allocator,
    "{\"count\":1,\"title\":\"hello\"}", .{});
defer parsed.deinit();
parsed.value.count += 1;
const bytes = try json.stringify(allocator, parsed.value);
defer allocator.free(bytes);
```

Strings and arrays decoded from input belong to the result's arena; input can
be released immediately. Unknown fields are rejected unless
`.ignore_unknown_fields = true`. Missing optional fields become null; struct
defaults apply. Duplicate recognized fields are rejected. Integers are range
checked without conversion through floating point. NaN/infinity and invalid
UTF-8 strings cannot be serialized.

Supported schema types: structs, bools, integers, floats, optionals, enums as
strings, arrays, and non-sentinel slices. `[]u8`/`[]const u8` are JSON strings;
fixed arrays are JSON arrays. String literal pointers serialize as strings.
Maps, tagged unions, custom serialization hooks and arbitrary decoding pointers
are outside this initial API. Recursive conversion is limited to 256 levels.
Finite numeric values must fit yyjson's native representation (i64/u64/f64).
`validate` and edit plans validate numeric syntax without that magnitude limit.

## Select native values

```zig
var doc = try json.Document.parse(bytes);
defer doc.deinit();
const value = try doc.get(allocator, "/records/0/id");
const id = try value.int(u64);
var encoded = try value.write();
defer encoded.deinit();
```

`Value` and `Value.string()` borrow from the document. Do not retain them after
`doc.deinit()`. `OwnedBytes` owns a libc allocation and releases it with
`deinit()`. Native DOM parsing/writing uses libc; typed result allocations and
edit-plan storage use the supplied Zig allocator. Do not copy owning handles
and deinitialize both copies. Independent documents/plans can be used on
independent threads; avoid racing deinitialization with reads.

## Reuse serialized JSON

```zig
var plan = try json.EditPlan.init(allocator, source_bytes,
    &.{ "/records/0/active", "/metadata/version" });
defer plan.deinit();

const output = try plan.apply(allocator, &.{ "true", "42" });
defer allocator.free(output);

// Or avoid the intermediate contiguous output buffer:
try plan.writeTo(writer, &.{ "false", "43" });
```

Pointers use RFC 6901: `""` selects the root, `~0` decodes to `~`, and `~1` to
`/`. Array indexes cannot have a leading zero. Pointer fragments (`#/...`)
are not accepted. Embedded NUL keys work. Missing paths, duplicate keys along
a selected path, and overlapping selections (including the same value twice)
are rejected. Other duplicate keys are preserved in serialized source.

An edit plan owns an immutable copy of the source and precomputed ranges. Each
call produces an independent version of that source. It does **not** accumulate
edits or update indexes after replacements. Replacements are complete JSON
value fragments, supplied in the same order as the original pointers, and all
are validated before output allocation/writing. Use `stringify` to encode a
Zig value into a replacement fragment. `original(index)` borrows the original
selected bytes until the plan is destroyed.

Whitespace, escape spellings, numeric spellings, and all untouched bytes are
preserved. This is not a canonical JSON serializer. The current API replaces
existing values; it does not insert/delete object members or array entries.

Setup validates the entire document and scans it once per selected pointer.
Applying a plan validates replacements, then copies the document once:
O(source bytes + replacement bytes + edit count), with one output allocation.
`writeTo` avoids that output allocation; it cannot eliminate the cost of
eventually sending/writing all bytes. Writer failure can leave partial output;
invalid replacement input produces no writes.

## Cottontail

An optional native capability and JS/TypeScript facade live in
`integrations/cottontail/`. The same core runs inside Cottontail; it does not
materialize a complete JS object tree unless explicitly requested.

```sh
zig build cottontail -Doptimize=ReleaseFast \
  -Dcottontail-root=/path/to/cottontail \
  -Djsc-include=/path/to/matching/jsc/include
cottontail integrations/cottontail/test.js
```

```js
import { loadJsonCapability } from './integrations/cottontail/index.js';
const json = loadJsonCapability('/absolute/path/to/libzig_json_cottontail.so');
const plan = json.prepare(bytes, ['/records/0/active', '/metadata/version']);
try {
  const output = plan.replace([true, 42]); // Uint8Array
  // Send output or write it to disk.
} finally {
  plan.dispose();
}
```

`replaceRaw` accepts already-encoded replacement fragments. `parseNative`
returns a document with `getBytes(pointer)` and `get(pointer)`; the latter
materializes only that subtree and uses ordinary JS numeric precision.
`getBytes` preserves native u64 integer precision. Disposal is idempotent;
subsequent reads/edits throw. A finalizer also releases abandoned handles.
Inputs can be strings or byte buffers; bytes avoid UTF-8 conversion overhead.

This adapter is ready to be packaged as a Cottontail capability, but is not
automatically registered in Cottontail/Hutch's standard-library manifests.
It uses version-matched prefixed JSC exports. Linux/macOS load a shared library;
Windows builds additionally require `-Djsc-import-library` for the runtime's
prefixed bridge import library. The adapter is locally tested on Linux ARM64;
other platforms require runtime integration testing. Set `ZIG_JSON_CAPABILITY`
to override the test's library path.

## Electrobun and GoldfishDB

`examples/main.zig` demonstrates a Zig main-process workflow: parse typed
state, encode it, reuse an edit plan, and select a native value. Use these
functions in an Electrobun Zig main process and pass the resulting bytes to
its existing transport. The library has no Electrobun dependency.

GoldfishDB is a future integration. Its current file and IndexedDB save paths
serialize the complete `_data` object. A cached serialized representation would
need reliable change records and cache invalidation. A library cannot observe
arbitrary JS object mutations automatically. Encryption, atomic writes and
the cost of writing the full document would remain separate considerations.

## Performance and validation

Run the included benchmark on your target hardware; it reports native typed
parse/edit/write, std.json, retained-state writing, fresh edit-plan setup, and
indexed edits. Every mode creates complete UTF-8 output. Indexed/retained modes
exclude setup. The benchmark is a small reproducible workload, not a universal
performance claim. A fresh plan is not necessarily faster than a native DOM
parse/write; reuse and sparse edits are its intended workloads.

Tests include JSONTestSuite's required acceptance/rejection cases, its
implementation-defined cases as non-crash checks, typed roundtrips, exact
integer bounds, JSON Pointer escapes, duplicate/overlap handling, byte
preservation, allocator failure cleanup, and streaming behavior. The optional
Cottontail suite covers boundary ownership, disposal, reentrancy, and value
replacement combinations. This is an initial implementation, not a claim of
complete ECMAScript JSON compatibility or a fuzz-audited production release.
