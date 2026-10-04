const std = @import("std");
const b = @import("backend.zig");
const c = b.c;

/// Owns libc memory. Call deinit once; copying this handle does not clone it.
pub const OwnedBytes = struct {
    bytes: []u8,
    pub fn deinit(self: *OwnedBytes) void {
        std.heap.c_allocator.free(self.bytes);
        self.* = undefined;
    }
};
/// Borrowed view, valid only while its Document is alive.
pub const Value = struct {
    raw: [*c]c.yyjson_val,
    pub fn boolean(self: Value) !bool {
        if (!c.yyjson_is_bool(self.raw)) return error.TypeMismatch;
        return c.yyjson_get_bool(self.raw);
    }
    pub fn string(self: Value) ![]const u8 {
        if (!c.yyjson_is_str(self.raw)) return error.TypeMismatch;
        return c.yyjson_get_str(self.raw)[0..c.yyjson_get_len(self.raw)];
    }
    pub fn int(self: Value, comptime T: type) !T {
        if (c.yyjson_is_uint(self.raw)) return std.math.cast(T, c.yyjson_get_uint(self.raw)) orelse error.NumberOutOfRange;
        if (c.yyjson_is_sint(self.raw)) return std.math.cast(T, c.yyjson_get_sint(self.raw)) orelse error.NumberOutOfRange;
        return error.TypeMismatch;
    }
    pub fn float(self: Value, comptime T: type) !T {
        if (!c.yyjson_is_num(self.raw)) return error.TypeMismatch;
        const out: T = @floatCast(c.yyjson_get_num(self.raw));
        if (!std.math.isFinite(out)) return error.NumberOutOfRange;
        return out;
    }
    pub fn isNull(self: Value) bool {
        return c.yyjson_is_null(self.raw);
    }
    pub fn get(self: Value, key: []const u8) !Value {
        if (!c.yyjson_is_obj(self.raw)) return error.TypeMismatch;
        const v = try b.unique(self.raw, key);
        if (v == null) return error.NotFound;
        return .{ .raw = v };
    }
    pub fn at(self: Value, index: usize) !Value {
        if (!c.yyjson_is_arr(self.raw)) return error.TypeMismatch;
        const v = c.yyjson_arr_get(self.raw, index);
        if (v == null) return error.NotFound;
        return .{ .raw = v };
    }
    pub fn write(self: Value) !OwnedBytes {
        var len: usize = 0;
        const p = c.yyjson_val_write(self.raw, 0, &len);
        if (p == null) return error.OutOfMemory;
        return .{ .bytes = p[0..len] };
    }
};

/// Native DOM. Input is copied/decoded by yyjson and may be released after parse.
pub const Document = struct {
    handle: *c.yyjson_doc,
    pub fn parse(input: []const u8) !Document {
        return .{ .handle = try b.read(input, false) };
    }
    pub fn deinit(self: *Document) void {
        c.yyjson_doc_free(self.handle);
        self.* = undefined;
    }
    pub fn root(self: *const Document) Value {
        return .{ .raw = c.yyjson_doc_get_root(self.handle) };
    }
    pub fn get(self: *const Document, allocator: std.mem.Allocator, pointer: []const u8) !Value {
        var arena = std.heap.ArenaAllocator.init(allocator);
        defer arena.deinit();
        const parts = try b.pointer(arena.allocator(), pointer);
        var v = self.root();
        for (parts) |part| {
            v = if (c.yyjson_is_obj(v.raw)) try v.get(part) else if (c.yyjson_is_arr(v.raw)) try v.at(try b.arrayIndex(part)) else return error.NotFound;
        }
        return v;
    }
};
