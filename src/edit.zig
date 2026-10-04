const std = @import("std");
const b = @import("backend.zig");
const Span = struct { start: usize, end: usize };
fn skip(s: *std.json.Scanner) !void {
    switch (try s.peekNextTokenType()) {
        .object_end, .array_end, .end_of_document => return error.ExpectedValue,
        else => try s.skipValue(),
    }
}

// Walk only the requested path, but scan/validate all other values too.
// Duplicate keys along the selected path are rejected instead of ambiguous edits.
fn walk(a: std.mem.Allocator, s: *std.json.Scanner, path: []const []const u8, result: *?Span) anyerror!void {
    if (path.len == 0) {
        var start = s.cursor;
        while (start < s.input.len and std.mem.indexOfScalar(u8, " \t\r\n,:", s.input[start]) != null) : (start += 1) {}
        try skip(s);
        if (result.* != null) return error.DuplicatePath;
        result.* = .{ .start = start, .end = s.cursor };
        return;
    }
    switch (try s.peekNextTokenType()) {
        .object_begin => {
            _ = try s.next();
            var matched = false;
            while (try s.peekNextTokenType() != .object_end) {
                const key = try s.nextAlloc(a, .alloc_if_needed);
                const name = switch (key) {
                    .string, .allocated_string => |v| v,
                    else => return error.ExpectedKey,
                };
                defer if (key == .allocated_string) a.free(name);
                if (std.mem.eql(u8, name, path[0])) {
                    if (matched) return error.DuplicatePath;
                    matched = true;
                    try walk(a, s, path[1..], result);
                } else try skip(s);
            }
            _ = try s.next();
        },
        .array_begin => {
            const wanted = try b.arrayIndex(path[0]);
            _ = try s.next();
            var index: usize = 0;
            while (try s.peekNextTokenType() != .array_end) : (index += 1) {
                if (index == wanted) try walk(a, s, path[1..], result) else try skip(s);
            }
            _ = try s.next();
        },
        else => try skip(s),
    }
}

fn locate(a: std.mem.Allocator, input: []const u8, path: []const []const u8) !Span {
    var s = std.json.Scanner.initCompleteInput(a, input);
    defer s.deinit();
    var result: ?Span = null;
    try walk(a, &s, path, &result);
    if (try s.next() != .end_of_document) return error.TrailingData;
    return result orelse error.NotFound;
}

const Slot = struct { span: Span, original_index: usize };
/// Immutable source snapshot plus precomputed non-overlapping value locations.
/// apply produces independent versions of that snapshot, not cumulative edits.
pub const EditPlan = struct {
    allocator: std.mem.Allocator,
    source: []const u8,
    slots: []const Slot,

    /// JSON Pointers follow RFC 6901 (empty pointer selects the root).
    /// Copies input; caller may release it immediately after this call.
    pub fn init(allocator: std.mem.Allocator, input: []const u8, pointers: []const []const u8) !EditPlan {
        const source = try allocator.dupe(u8, input);
        errdefer allocator.free(source);
        try b.validate(source);
        const slots = try allocator.alloc(Slot, pointers.len);
        errdefer allocator.free(slots);
        var arena = std.heap.ArenaAllocator.init(allocator);
        defer arena.deinit();
        for (pointers, slots, 0..) |pointer, *slot, i| {
            const parts = try b.pointer(arena.allocator(), pointer);
            slot.* = .{ .span = try locate(arena.allocator(), source, parts), .original_index = i };
            _ = arena.reset(.retain_capacity);
        }
        std.mem.sort(Slot, slots, {}, struct {
            fn less(_: void, x: Slot, y: Slot) bool {
                return x.span.start < y.span.start;
            }
        }.less);
        for (slots, 0..) |slot, i| {
            if (i > 0 and slot.span.start < slots[i - 1].span.end) return error.OverlappingPaths;
        }
        return .{ .allocator = allocator, .source = source, .slots = slots };
    }
    pub fn deinit(self: *EditPlan) void {
        self.allocator.free(self.source);
        self.allocator.free(self.slots);
        self.* = undefined;
    }
    /// Borrowed original value bytes in the caller's original pointer order.
    pub fn original(self: *const EditPlan, index: usize) ![]const u8 {
        for (self.slots) |slot| if (slot.original_index == index) return self.source[slot.span.start..slot.span.end];
        return error.NotFound;
    }
    fn outputSize(self: *const EditPlan, replacements: []const []const u8) !usize {
        if (replacements.len != self.slots.len) return error.ReplacementCount;
        var size = self.source.len;
        for (self.slots) |slot| {
            const value = replacements[slot.original_index];
            try b.validate(value);
            size -= slot.span.end - slot.span.start;
        }
        for (replacements) |value| size = try std.math.add(usize, size, value.len);
        return size;
    }
    /// Validate all replacements, then allocate and copy the output once.
    /// Replacement fragments are JSON values, not unescaped strings.
    pub fn apply(self: *const EditPlan, allocator: std.mem.Allocator, replacements: []const []const u8) ![]u8 {
        const size = try self.outputSize(replacements);
        const output = try allocator.alloc(u8, size);
        var dest: usize = 0;
        var source: usize = 0;
        for (self.slots) |slot| {
            const prefix = self.source[source..slot.span.start];
            @memcpy(output[dest..][0..prefix.len], prefix);
            dest += prefix.len;
            const replacement = replacements[slot.original_index];
            @memcpy(output[dest..][0..replacement.len], replacement);
            dest += replacement.len;
            source = slot.span.end;
        }
        @memcpy(output[dest..], self.source[source..]);
        return output;
    }
    /// Stream unchanged slices and replacements without an intermediate full
    /// output buffer. Validates every replacement before the first write.
    pub fn writeTo(self: *const EditPlan, writer: *std.Io.Writer, replacements: []const []const u8) !void {
        _ = try self.outputSize(replacements);
        var source: usize = 0;
        for (self.slots) |slot| {
            try writer.writeAll(self.source[source..slot.span.start]);
            try writer.writeAll(replacements[slot.original_index]);
            source = slot.span.end;
        }
        try writer.writeAll(self.source[source..]);
    }
};
