const std = @import("std");
const json = @import("zig-json");

// This module can be used unchanged in an Electrobun Zig main process.
// Send the returned bytes through the application's existing transport.
pub fn main() !void {
    const a = std.heap.page_allocator;
    const State = struct { count: u32, title: []const u8, ready: bool = false };
    var state = try json.parse(State, a, "{\"count\":1,\"title\":\"hello\"}", .{});
    defer state.deinit();
    state.value.count += 1;
    const serialized = try json.stringify(a, state.value);
    defer a.free(serialized);
    std.debug.print("typed: {s}\n", .{serialized});

    var plan = try json.EditPlan.init(a, serialized, &.{ "/count", "/ready" });
    defer plan.deinit();
    const output = try plan.apply(a, &.{ "42", "true" });
    defer a.free(output);
    std.debug.print("edited: {s}\n", .{output});

    var doc = try json.Document.parse(output);
    defer doc.deinit();
    const count = try (try doc.get(a, "/count")).int(u32);
    std.debug.print("selected: {d}\n", .{count});
}
