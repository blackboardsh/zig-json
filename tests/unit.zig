const std = @import("std");
const json = @import("zig-json");
const a = std.testing.allocator;

test "typed roundtrip, exact integers, defaults, optionals, owned strings" {
    const T = struct { min: i64, max: u64, name: []const u8, values: []i32, enabled: bool = true, missing: ?u32, kind: enum { one, two } };
    var p = try json.parse(T, a, "{\"min\":-9223372036854775808,\"max\":18446744073709551615,\"name\":\"café\\u0000hi\",\"values\":[-1,2],\"kind\":\"two\"}", .{});
    defer p.deinit();
    try std.testing.expectEqual(std.math.minInt(i64), p.value.min);
    try std.testing.expectEqual(std.math.maxInt(u64), p.value.max);
    try std.testing.expect(p.value.enabled and p.value.missing == null);
    try std.testing.expectEqualStrings("café\x00hi", p.value.name);
    const out = try json.stringify(a, p.value);
    defer a.free(out);
    var q = try json.parse(T, a, out, .{});
    defer q.deinit();
    try std.testing.expectEqualDeep(p.value, q.value);
}
test "typed errors and strict unknown field policy" {
    const T = struct { x: u8 };
    try std.testing.expectError(error.NumberOutOfRange, json.parse(T, a, "{\"x\":256}", .{}));
    try std.testing.expectError(error.MissingField, json.parse(T, a, "{}", .{}));
    try std.testing.expectError(error.DuplicateKey, json.parse(T, a, "{\"x\":1,\"x\":2}", .{}));
    try std.testing.expectError(error.UnknownField, json.parse(T, a, "{\"x\":1,\"y\":2}", .{}));
    try std.testing.expectError(error.TypeMismatch, json.parse(T, a, "{\"x\":1.5}", .{}));
    try std.testing.expectError(error.NonFiniteNumber, json.stringify(a, std.math.inf(f64)));
    try std.testing.expectError(error.InvalidUtf8, json.stringify(a, @as([]const u8, "\xff")));
    var p = try json.parse(T, a, "{\"x\":1,\"y\":2}", .{ .ignore_unknown_fields = true });
    defer p.deinit();
    try std.testing.expectEqual(1, p.value.x);
}
test "DOM borrowed access, pointer escapes, exact integers, and native output" {
    var doc = try json.Document.parse("{\"a/b\":{\"~\":[18446744073709551615,true]},\"\\u0000\":\"ok\"}");
    defer doc.deinit();
    try std.testing.expectEqual(std.math.maxInt(u64), try (try doc.get(a, "/a~1b/~0/0")).int(u64));
    try std.testing.expect(try (try doc.get(a, "/a~1b/~0/1")).boolean());
    try std.testing.expectEqualStrings("ok", try (try doc.get(a, "/\x00")).string());
    try std.testing.expectError(error.InvalidPointer, doc.get(a, "/a~1b/~0/01"));
    var bytes = try doc.root().write();
    defer bytes.deinit();
    try json.validate(bytes.bytes);
}
fn exerciseEdits(allocator: std.mem.Allocator) !void {
    const source = " \n{\"a/b\": [1, {\"na\\u006de\": \"café\"}], \"~\":false, \"unchanged\":1e+02} \t";
    var plan = try json.EditPlan.init(allocator, source, &.{ "/~0", "/a~1b/1/name" });
    defer plan.deinit();
    try std.testing.expectEqualStrings("false", try plan.original(0));
    const out = try plan.apply(allocator, &.{ "true", "\"longer \\u0000 name\"" });
    defer allocator.free(out);
    try std.testing.expectEqualStrings(" \n{\"a/b\": [1, {\"na\\u006de\": \"longer \\u0000 name\"}], \"~\":true, \"unchanged\":1e+02} \t", out);
    var buffer: [512]u8 = undefined;
    var writer = std.Io.Writer.fixed(&buffer);
    try plan.writeTo(&writer, &.{ "true", "\"longer \\u0000 name\"" });
    try std.testing.expectEqualStrings(out, writer.buffered());
    try std.testing.expectEqualStrings("false", try plan.original(0));
}
test "batch edits, source preservation, streaming, and allocation failure cleanup" {
    try exerciseEdits(a);
    try std.testing.checkAllAllocationFailures(a, exerciseEdits, .{});
}
test "edit rejection and root replacement" {
    try std.testing.expectError(error.OverlappingPaths, json.EditPlan.init(a, "{\"a\":[1]}", &.{ "/a", "/a/0" }));
    try std.testing.expectError(error.OverlappingPaths, json.EditPlan.init(a, "[1]", &.{ "/0", "/0" }));
    try std.testing.expectError(error.DuplicatePath, json.EditPlan.init(a, "{\"a\":1,\"a\":2}", &.{"/a"}));
    try std.testing.expectError(error.InvalidPointer, json.EditPlan.init(a, "[1]", &.{"/01"}));
    try std.testing.expectError(error.InvalidPointer, json.EditPlan.init(a, "{}", &.{"/~2"}));
    try std.testing.expectError(error.NotFound, json.EditPlan.init(a, "{}", &.{"/absent"}));
    var p = try json.EditPlan.init(a, " \n[1,2] \t", &.{""});
    defer p.deinit();
    const out = try p.apply(a, &.{"{\"x\":true}"});
    defer a.free(out);
    try std.testing.expectEqualStrings(" \n{\"x\":true} \t", out);
    try std.testing.expectError(error.InvalidJson, p.apply(a, &.{"true garbage"}));
    try std.testing.expectError(error.ReplacementCount, p.apply(a, &.{}));
    var buffer: [100]u8 = undefined;
    var writer = std.Io.Writer.fixed(&buffer);
    try std.testing.expectError(error.InvalidJson, p.writeTo(&writer, &.{"[1,]"}));
    try std.testing.expectEqual(@as(usize, 0), writer.buffered().len);
}
test "validation accepts large numeric syntax, rejects malformed UTF-8" {
    try json.validate("1e9999");
    try std.testing.expectError(error.InvalidJson, json.validate("\"\xff\""));
    try std.testing.expectError(error.InvalidJson, json.validate("[1,]"));
}

test "fixed byte arrays, string literals, nullable arrays, floats" {
    const T = struct { bytes: [3]u8, fraction: f32, extra: ?[]const u8 };
    const value = T{ .bytes = .{ 0, 127, 255 }, .fraction = 1.25, .extra = null };
    const encoded = try json.stringify(a, value);
    defer a.free(encoded);
    var decoded = try json.parse(T, a, encoded, .{});
    defer decoded.deinit();
    try std.testing.expectEqualDeep(value, decoded.value);
    const literal = try json.stringify(a, "hi");
    defer a.free(literal);
    try std.testing.expectEqualStrings("\"hi\"", literal);
}

fn typedAllocation(allocator: std.mem.Allocator) !void {
    const T = struct { names: [][]const u8, nested: []struct { x: i32 } };
    var p = try json.parse(T, allocator, "{\"names\":[\"one\",\"two\"],\"nested\":[{\"x\":-1}]}", .{});
    defer p.deinit();
    const out = try json.stringify(allocator, p.value);
    defer allocator.free(out);
    try json.validate(out);
}
test "typed Zig allocator failures release partial results" {
    try std.testing.checkAllAllocationFailures(a, typedAllocation, .{});
}

test "plan copies caller storage and zero-edit plan preserves everything" {
    const source = try a.dupe(u8, " {\"x\":1} ");
    var p = try json.EditPlan.init(a, source, &.{});
    defer p.deinit();
    @memset(source, ' ');
    a.free(source);
    const out = try p.apply(a, &.{});
    defer a.free(out);
    try std.testing.expectEqualStrings(" {\"x\":1} ", out);
}
