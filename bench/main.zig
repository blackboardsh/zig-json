const std = @import("std");
const json = @import("zig-json");
const a = std.heap.page_allocator;
fn now() i96 {
    return std.Io.Clock.awake.now(std.Io.Threaded.global_single_threaded.io()).nanoseconds;
}
const Item = struct { id: u32, name: []const u8, active: bool, scores: [3]i32 };
const State = struct { records: []Item };
const Mode = enum { std_full, native_full, retained_write, scan_splice, indexed_splice };
pub fn main() !void {
    const items = try a.alloc(Item, 10000);
    defer a.free(items);
    for (items, 0..) |*item, i| item.* = .{ .id = @intCast(i), .name = "café with \"quotes\"", .active = false, .scores = .{ -1, 2, 300 } };
    const base = State{ .records = items };
    const input = try json.stringify(a, base);
    defer a.free(input);
    var plan = try json.EditPlan.init(a, input, &.{"/records/0/active"});
    defer plan.deinit();
    std.debug.print("{d} bytes, 10000 records; microseconds/op (warm input, full output)\n", .{input.len});
    inline for (comptime std.meta.tags(Mode)) |mode| {
        var sink: usize = 0;
        for (0..10) |_| sink +%= try once(mode, input, base, &plan);
        const start = now();
        var n: usize = 0;
        while (now() - start < 300_000_000) : (n += 1) sink +%= try once(mode, input, base, &plan);
        std.debug.print("{s}: {d:.3} us ({d} ops, sink={d})\n", .{ @tagName(mode), @as(f64, @floatFromInt(now() - start)) / 1000 / @as(f64, @floatFromInt(n)), n, sink });
    }
}
fn once(comptime mode: Mode, input: []const u8, base: State, plan: *json.EditPlan) !usize {
    const out = switch (mode) {
        .std_full => blk: {
            var p = try std.json.parseFromSlice(State, a, input, .{});
            defer p.deinit();
            p.value.records[0].active = true;
            break :blk try std.json.Stringify.valueAlloc(a, p.value, .{});
        },
        .native_full => blk: {
            var p = try json.parse(State, a, input, .{});
            defer p.deinit();
            p.value.records[0].active = true;
            break :blk try json.stringify(a, p.value);
        },
        .retained_write => blk: {
            base.records[0].active = true;
            break :blk try json.stringify(a, base);
        },
        .scan_splice => blk: {
            var p = try json.EditPlan.init(a, input, &.{"/records/0/active"});
            defer p.deinit();
            break :blk try p.apply(a, &.{"true"});
        },
        .indexed_splice => try plan.apply(a, &.{"true"}),
    };
    defer a.free(out);
    std.mem.doNotOptimizeAway(out.ptr);
    return out.len + out[out.len / 2];
}
