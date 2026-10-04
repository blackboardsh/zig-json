const std = @import("std");
const b = @import("backend.zig");
const c = b.c;
const Document = @import("document.zig").Document;
const Value = @import("document.zig").Value;
pub const ParseOptions = struct { ignore_unknown_fields: bool = false };
pub fn Parsed(comptime T: type) type {
    return struct {
        arena: *std.heap.ArenaAllocator,
        value: T,
        pub fn deinit(self: *@This()) void {
            const a = self.arena.child_allocator;
            self.arena.deinit();
            a.destroy(self.arena);
            self.* = undefined;
        }
    };
}
/// Returned strings and arrays are owned by the result, never by input.
pub fn parse(comptime T: type, allocator: std.mem.Allocator, input: []const u8, options: ParseOptions) !Parsed(T) {
    var doc = try Document.parse(input);
    defer doc.deinit();
    const arena = try allocator.create(std.heap.ArenaAllocator);
    arena.* = std.heap.ArenaAllocator.init(allocator);
    errdefer {
        arena.deinit();
        allocator.destroy(arena);
    }
    return .{ .arena = arena, .value = try decode(T, arena.allocator(), doc.root(), options, 0) };
}
fn decode(comptime T: type, a: std.mem.Allocator, v: Value, opts: ParseOptions, depth: usize) anyerror!T {
    if (depth > 256) return error.DepthLimit;
    return switch (@typeInfo(T)) {
        .bool => v.boolean(),
        .int => v.int(T),
        .float => v.float(T),
        .optional => |o| if (v.isNull()) null else try decode(o.child, a, v, opts, depth + 1),
        .@"enum" => std.meta.stringToEnum(T, try v.string()) orelse error.TypeMismatch,
        .pointer => |p| blk: {
            if (p.size != .slice or p.sentinel_ptr != null) @compileError("JSON decoding supports non-sentinel slices, not arbitrary pointers");
            if (p.child == u8) break :blk try a.dupe(u8, try v.string());
            if (!c.yyjson_is_arr(v.raw)) return error.TypeMismatch;
            const out = try a.alloc(p.child, c.yyjson_arr_size(v.raw));
            var it = c.yyjson_arr_iter_with(v.raw);
            for (out) |*item| item.* = try decode(p.child, a, .{ .raw = c.yyjson_arr_iter_next(&it) }, opts, depth + 1);
            break :blk out;
        },
        .array => |arr| blk: {
            if (!c.yyjson_is_arr(v.raw) or c.yyjson_arr_size(v.raw) != arr.len) return error.TypeMismatch;
            var out: T = undefined;
            for (&out, 0..) |*item, i| item.* = try decode(arr.child, a, try v.at(i), opts, depth + 1);
            break :blk out;
        },
        .@"struct" => |s| blk: {
            if (!c.yyjson_is_obj(v.raw)) return error.TypeMismatch;
            var out: T = undefined;
            inline for (s.fields) |f| {
                if (f.is_comptime) @compileError("Comptime struct fields are not supported");
                const raw = try b.unique(v.raw, f.name);
                if (raw != null) @field(out, f.name) = try decode(f.type, a, .{ .raw = raw }, opts, depth + 1) else if (f.defaultValue()) |default| @field(out, f.name) = default else if (@typeInfo(f.type) == .optional) @field(out, f.name) = null else return error.MissingField;
            }
            if (!opts.ignore_unknown_fields) {
                var it = c.yyjson_obj_iter_with(v.raw);
                while (c.yyjson_obj_iter_next(&it)) |key| {
                    const name = c.yyjson_get_str(key)[0..c.yyjson_get_len(key)];
                    var known = false;
                    inline for (s.fields) |f| {
                        if (std.mem.eql(u8, name, f.name)) known = true;
                    }
                    if (!known) return error.UnknownField;
                }
            }
            break :blk out;
        },
        else => @compileError("Unsupported JSON type: " ++ @typeName(T)),
    };
}

fn encode(comptime T: type, doc: *c.yyjson_mut_doc, value: T, depth: usize) anyerror![*c]c.yyjson_mut_val {
    if (depth > 256) return error.DepthLimit;
    const raw = switch (@typeInfo(T)) {
        .null => c.yyjson_mut_null(doc),
        .bool => c.yyjson_mut_bool(doc, value),
        .int => |i| blk: {
            if (i.signedness == .signed) break :blk c.yyjson_mut_sint(doc, std.math.cast(i64, value) orelse return error.NumberOutOfRange);
            break :blk c.yyjson_mut_uint(doc, std.math.cast(u64, value) orelse return error.NumberOutOfRange);
        },
        .comptime_int => if (value < 0) c.yyjson_mut_sint(doc, value) else c.yyjson_mut_uint(doc, value),
        .float, .comptime_float => blk: {
            const f: f64 = @floatCast(value);
            if (!std.math.isFinite(f)) return error.NonFiniteNumber;
            break :blk c.yyjson_mut_real(doc, f);
        },
        .optional => if (value) |v| try encode(@TypeOf(v), doc, v, depth + 1) else c.yyjson_mut_null(doc),
        .@"enum" => try encode([]const u8, doc, @tagName(value), depth + 1),
        .pointer => |p| blk: {
            if (p.size == .one) {
                if (@typeInfo(p.child) == .array and @typeInfo(p.child).array.child == u8)
                    break :blk try encode([]const u8, doc, value, depth + 1);
                break :blk try encode(p.child, doc, value.*, depth + 1);
            }
            if (p.size != .slice) @compileError("JSON encoding requires a slice or single pointer");
            if (p.child == u8) {
                if (!std.unicode.utf8ValidateSlice(value)) return error.InvalidUtf8;
                break :blk c.yyjson_mut_strncpy(doc, value.ptr, value.len);
            }
            const arr = c.yyjson_mut_arr(doc);
            if (arr == null) return error.OutOfMemory;
            for (value) |item| if (!c.yyjson_mut_arr_append(arr, try encode(p.child, doc, item, depth + 1))) return error.OutOfMemory;
            break :blk arr;
        },
        .array => |arr| blk: {
            const result = c.yyjson_mut_arr(doc);
            if (result == null) return error.OutOfMemory;
            for (value) |item| if (!c.yyjson_mut_arr_append(result, try encode(arr.child, doc, item, depth + 1))) return error.OutOfMemory;
            break :blk result;
        },
        .@"struct" => |s| blk: {
            const obj = c.yyjson_mut_obj(doc);
            if (obj == null) return error.OutOfMemory;
            inline for (s.fields) |f| {
                if (!std.unicode.utf8ValidateSlice(f.name)) return error.InvalidUtf8;
                const key = c.yyjson_mut_strncpy(doc, f.name.ptr, f.name.len);
                if (key == null) return error.OutOfMemory;
                if (!c.yyjson_mut_obj_add(obj, key, try encode(f.type, doc, @field(value, f.name), depth + 1))) return error.OutOfMemory;
            }
            break :blk obj;
        },
        else => @compileError("Unsupported JSON type: " ++ @typeName(T)),
    };
    if (raw == null) return error.OutOfMemory;
    return raw;
}
/// Compact JSON; caller frees output with allocator. Unlike JS, no hooks/getters.
pub fn stringify(allocator: std.mem.Allocator, value: anytype) ![]u8 {
    const doc = c.yyjson_mut_doc_new(null) orelse return error.OutOfMemory;
    defer c.yyjson_mut_doc_free(doc);
    c.yyjson_mut_doc_set_root(doc, try encode(@TypeOf(value), doc, value, 0));
    var len: usize = 0;
    const p = c.yyjson_mut_write(doc, 0, &len);
    if (p == null) return error.OutOfMemory;
    defer std.heap.c_allocator.free(p[0..len]);
    return allocator.dupe(u8, p[0..len]);
}
