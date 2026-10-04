pub const c = @cImport({
    @cDefine("YYJSON_DISABLE_UTILS", "1");
    @cInclude("yyjson.h");
});
const std = @import("std");
pub const Error = error{ InvalidJson, OutOfMemory, NumberOutOfRange, TypeMismatch, MissingField, UnknownField, DuplicateKey, InvalidPointer, NotFound, InvalidUtf8, NonFiniteNumber, DepthLimit };

pub fn read(input: []const u8, raw_numbers: bool) Error!*c.yyjson_doc {
    var detail: c.yyjson_read_err = undefined;
    return c.yyjson_read_opts(@constCast(input.ptr), input.len, if (raw_numbers) c.YYJSON_READ_NUMBER_AS_RAW else 0, null, &detail) orelse switch (detail.code) {
        c.YYJSON_READ_ERROR_MEMORY_ALLOCATION => error.OutOfMemory,
        else => error.InvalidJson,
    };
}
/// Validate strict JSON without imposing an f64/i64 range on its numbers.
pub fn validate(input: []const u8) Error!void {
    const d = try read(input, true);
    c.yyjson_doc_free(d);
}

/// Decoded RFC 6901 path components, allocated from caller's arena.
pub fn pointer(a: std.mem.Allocator, text: []const u8) ![][]const u8 {
    if (text.len == 0) return a.alloc([]const u8, 0);
    if (text[0] != '/') return error.InvalidPointer;
    var parts: std.ArrayList([]const u8) = .empty;
    var it = std.mem.splitScalar(u8, text[1..], '/');
    while (it.next()) |part| {
        if (parts.items.len >= 256) return error.DepthLimit;
        var decoded: std.ArrayList(u8) = .empty;
        var i: usize = 0;
        while (i < part.len) : (i += 1) {
            if (part[i] == '~') {
                i += 1;
                if (i == part.len) return error.InvalidPointer;
                try decoded.append(a, switch (part[i]) {
                    '0' => '~',
                    '1' => '/',
                    else => return error.InvalidPointer,
                });
            } else try decoded.append(a, part[i]);
        }
        try parts.append(a, try decoded.toOwnedSlice(a));
    }
    return parts.toOwnedSlice(a);
}
pub fn arrayIndex(text: []const u8) Error!usize {
    if (text.len == 0 or (text.len > 1 and text[0] == '0')) return error.InvalidPointer;
    for (text) |ch| if (ch < '0' or ch > '9') return error.InvalidPointer;
    return std.fmt.parseInt(usize, text, 10) catch error.InvalidPointer;
}
pub fn unique(v: [*c]c.yyjson_val, key: []const u8) Error![*c]c.yyjson_val {
    var iter = c.yyjson_obj_iter_with(v);
    var result: [*c]c.yyjson_val = null;
    while (c.yyjson_obj_iter_next(&iter)) |k| {
        if (std.mem.eql(u8, c.yyjson_get_str(k)[0..c.yyjson_get_len(k)], key)) {
            if (result != null) return error.DuplicateKey;
            result = c.yyjson_obj_iter_get_val(k);
        }
    }
    return result;
}
