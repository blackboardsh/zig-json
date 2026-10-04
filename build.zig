const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const json = b.addModule("zig-json", .{ .root_source_file = b.path("src/root.zig"), .target = target, .optimize = optimize, .link_libc = true });
    json.addIncludePath(b.path("vendor/yyjson"));
    json.addCSourceFile(.{ .file = b.path("vendor/yyjson/yyjson.c"), .flags = &.{"-std=c99"} });
    const tests = b.addTest(.{ .root_module = b.createModule(.{ .root_source_file = b.path("tests.zig"), .target = target, .optimize = optimize, .imports = &.{.{ .name = "zig-json", .module = json }} }) });
    b.step("test", "Run unit and upstream JSON conformance tests").dependOn(&b.addRunArtifact(tests).step);
    b.step("check", "Compile tests without running (supports cross compilation)").dependOn(&tests.step);
    const example = b.addExecutable(.{ .name = "zig-json-example", .root_module = b.createModule(.{ .root_source_file = b.path("examples/main.zig"), .target = target, .optimize = optimize, .imports = &.{.{ .name = "zig-json", .module = json }} }) });
    b.installArtifact(example);
    b.step("example", "Run the standalone / Electrobun main-process example").dependOn(&b.addRunArtifact(example).step);
    const bench = b.addExecutable(.{ .name = "zig-json-bench", .root_module = b.createModule(.{ .root_source_file = b.path("bench/main.zig"), .target = target, .optimize = optimize, .imports = &.{.{ .name = "zig-json", .module = json }} }) });
    const run_bench = b.addRunArtifact(bench);
    if (b.args) |args| run_bench.addArgs(args);
    b.step("bench", "Benchmark typed JSON and indexed edits (use ReleaseFast)").dependOn(&run_bench.step);
    if (b.option([]const u8, "cottontail-root", "Path to matching Cottontail source checkout")) |root| {
        const headers = b.option([]const u8, "jsc-include", "Path to the matching JSC include directory") orelse @panic("-Djsc-include is required with -Dcottontail-root");
        const adapter = b.createModule(.{ .root_source_file = b.path("integrations/cottontail/api.zig"), .target = target, .optimize = optimize, .link_libc = true, .pic = true, .imports = &.{.{ .name = "zig-json", .module = json }} });
        adapter.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{ root, "src/stdlib" }) });
        adapter.addIncludePath(.{ .cwd_relative = headers });
        adapter.addCSourceFile(.{ .file = b.path("integrations/cottontail/bridge.c"), .flags = &.{"-std=c11"} });
        const lib = b.addLibrary(.{ .name = "zig_json_cottontail", .linkage = .dynamic, .root_module = adapter });
        lib.linker_allow_shlib_undefined = true;
        if (target.result.os.tag == .windows) {
            const imports = b.option([]const u8, "jsc-import-library", "Cottontail prefixed bridge import .lib (Windows)") orelse @panic("Windows requires -Djsc-import-library");
            adapter.addObjectFile(.{ .cwd_relative = imports });
        }
        b.step("cottontail", "Build the optional Cottontail native capability").dependOn(&b.addInstallArtifact(lib, .{}).step);
    }
}
