const std = @import("std");
const json = @import("zig-json");
const a = std.heap.c_allocator;
const Slice = extern struct { ptr: [*]const u8, len: usize };
threadlocal var last_error: [:0]const u8 = "Unknown error";
fn fail(err: anyerror) void {
    last_error = @errorName(err);
}
export fn zj_error() [*:0]const u8 {
    return last_error.ptr;
}
fn slices(input: [*]const Slice, n: usize) ![][]const u8 {
    const out = try a.alloc([]const u8, n);
    for (out, input[0..n]) |*dest, src| dest.* = src.ptr[0..src.len];
    return out;
}
export fn zj_prepare(input: [*]const u8, n: usize, paths: [*]const Slice, count: usize) ?*json.EditPlan {
    const p = slices(paths, count) catch |e| {
        fail(e);
        return null;
    };
    defer a.free(p);
    const result = a.create(json.EditPlan) catch |e| {
        fail(e);
        return null;
    };
    result.* = json.EditPlan.init(a, input[0..n], p) catch |e| {
        a.destroy(result);
        fail(e);
        return null;
    };
    return result;
}
export fn zj_plan_free(plan: *json.EditPlan) void {
    plan.deinit();
    a.destroy(plan);
}
export fn zj_apply(plan: *const json.EditPlan, values: [*]const Slice, count: usize, len: *usize) ?[*]u8 {
    const v = slices(values, count) catch |e| {
        fail(e);
        return null;
    };
    defer a.free(v);
    const out = plan.apply(a, v) catch |e| {
        fail(e);
        return null;
    };
    len.* = out.len;
    return out.ptr;
}
export fn zj_original(plan: *const json.EditPlan, index: usize, len: *usize) ?[*]u8 {
    const original = plan.original(index) catch |e| {
        fail(e);
        return null;
    };
    const out = a.dupe(u8, original) catch |e| {
        fail(e);
        return null;
    };
    len.* = out.len;
    return out.ptr;
}
export fn zj_parse(input: [*]const u8, len: usize) ?*json.Document {
    const doc = a.create(json.Document) catch |e| {
        fail(e);
        return null;
    };
    doc.* = json.Document.parse(input[0..len]) catch |e| {
        a.destroy(doc);
        fail(e);
        return null;
    };
    return doc;
}
export fn zj_doc_free(doc: *json.Document) void {
    doc.deinit();
    a.destroy(doc);
}
export fn zj_get(doc: *const json.Document, pointer: [*]const u8, pn: usize, len: *usize) ?[*]u8 {
    const value = doc.get(a, pointer[0..pn]) catch |e| {
        fail(e);
        return null;
    };
    const output = value.write() catch |e| {
        fail(e);
        return null;
    };
    len.* = output.bytes.len;
    return output.bytes.ptr;
}
