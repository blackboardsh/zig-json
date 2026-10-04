//! Native JSON and immutable serialized editing. All ownership is explicit.
pub const validate = @import("backend.zig").validate;
pub const Error = @import("backend.zig").Error;
pub const Document = @import("document.zig").Document;
pub const Value = @import("document.zig").Value;
pub const OwnedBytes = @import("document.zig").OwnedBytes;
pub const parse = @import("typed.zig").parse;
pub const Parsed = @import("typed.zig").Parsed;
pub const stringify = @import("typed.zig").stringify;
pub const ParseOptions = @import("typed.zig").ParseOptions;
pub const EditPlan = @import("edit.zig").EditPlan;
