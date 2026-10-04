# Third-party code and test data

## yyjson

- Upstream: https://github.com/ibireme/yyjson
- Revision: `6447536015f3d600f3d65323b10976103b337ca7` (0.13.0)
- Vendored: `vendor/yyjson/yyjson.c`, `yyjson.h`, and `LICENSE`, unmodified.
- License: MIT, copyright YaoYuan. See `vendor/yyjson/LICENSE`.

The Zig import defines `YYJSON_DISABLE_UTILS` to exclude unused JSON Pointer and
Patch helpers that expose C-translation issues. Core parsing/writing is enabled.
yyjson does not use SIMD. This project makes no SIMD implementation claim.

## JSONTestSuite

- Upstream: https://github.com/nst/JSONTestSuite
- Revision: `1ef36fa01286573e846ac449e8683f8833c5b26a`
- Vendored: the 318 files from `test_parsing/` and upstream `LICENSE`.
- License: MIT, copyright Nicolas Seriot. See `tests/JSONTestSuite/LICENSE`.

`tests/corpus.zig` checks all 283 required `y_` (accept) and `n_` (reject) cases.
The 35 `i_` cases permit either acceptance or an invalid-JSON result, but must
not crash. This follows the upstream classification; passing does not mean
every implementation-defined encoding/number form is supported.

## Cottontail

The optional adapter includes the matching runtime's public capability headers
from a user-specified checkout. Those headers and JavaScriptCore binaries are
not redistributed here. Build and ship the capability against the runtime
version that will load it; the prefixed bridge is runtime-specific.
