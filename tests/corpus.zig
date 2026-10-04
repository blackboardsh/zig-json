const std = @import("std");
const json = @import("zig-json");
test "JSONTestSuite n_array_1_true_without_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_1_true_without_comma.json")));
}
test "JSONTestSuite n_array_a_invalid_utf8.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_a_invalid_utf8.json")));
}
test "JSONTestSuite n_array_colon_instead_of_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_colon_instead_of_comma.json")));
}
test "JSONTestSuite n_array_comma_after_close.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_comma_after_close.json")));
}
test "JSONTestSuite n_array_comma_and_number.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_comma_and_number.json")));
}
test "JSONTestSuite n_array_double_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_double_comma.json")));
}
test "JSONTestSuite n_array_double_extra_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_double_extra_comma.json")));
}
test "JSONTestSuite n_array_extra_close.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_extra_close.json")));
}
test "JSONTestSuite n_array_extra_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_extra_comma.json")));
}
test "JSONTestSuite n_array_incomplete.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_incomplete.json")));
}
test "JSONTestSuite n_array_incomplete_invalid_value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_incomplete_invalid_value.json")));
}
test "JSONTestSuite n_array_inner_array_no_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_inner_array_no_comma.json")));
}
test "JSONTestSuite n_array_invalid_utf8.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_invalid_utf8.json")));
}
test "JSONTestSuite n_array_items_separated_by_semicolon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_items_separated_by_semicolon.json")));
}
test "JSONTestSuite n_array_just_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_just_comma.json")));
}
test "JSONTestSuite n_array_just_minus.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_just_minus.json")));
}
test "JSONTestSuite n_array_missing_value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_missing_value.json")));
}
test "JSONTestSuite n_array_newlines_unclosed.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_newlines_unclosed.json")));
}
test "JSONTestSuite n_array_number_and_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_number_and_comma.json")));
}
test "JSONTestSuite n_array_number_and_several_commas.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_number_and_several_commas.json")));
}
test "JSONTestSuite n_array_spaces_vertical_tab_formfeed.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_spaces_vertical_tab_formfeed.json")));
}
test "JSONTestSuite n_array_star_inside.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_star_inside.json")));
}
test "JSONTestSuite n_array_unclosed.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_unclosed.json")));
}
test "JSONTestSuite n_array_unclosed_trailing_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_unclosed_trailing_comma.json")));
}
test "JSONTestSuite n_array_unclosed_with_new_lines.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_unclosed_with_new_lines.json")));
}
test "JSONTestSuite n_array_unclosed_with_object_inside.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_array_unclosed_with_object_inside.json")));
}
test "JSONTestSuite n_incomplete_false.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_incomplete_false.json")));
}
test "JSONTestSuite n_incomplete_null.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_incomplete_null.json")));
}
test "JSONTestSuite n_incomplete_true.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_incomplete_true.json")));
}
test "JSONTestSuite n_multidigit_number_then_00.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_multidigit_number_then_00.json")));
}
test "JSONTestSuite n_number_++.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_++.json")));
}
test "JSONTestSuite n_number_+1.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_+1.json")));
}
test "JSONTestSuite n_number_+Inf.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_+Inf.json")));
}
test "JSONTestSuite n_number_-01.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_-01.json")));
}
test "JSONTestSuite n_number_-1.0..json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_-1.0..json")));
}
test "JSONTestSuite n_number_-2..json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_-2..json")));
}
test "JSONTestSuite n_number_-NaN.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_-NaN.json")));
}
test "JSONTestSuite n_number_.-1.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_.-1.json")));
}
test "JSONTestSuite n_number_.2e-3.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_.2e-3.json")));
}
test "JSONTestSuite n_number_0.1.2.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0.1.2.json")));
}
test "JSONTestSuite n_number_0.3e+.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0.3e+.json")));
}
test "JSONTestSuite n_number_0.3e.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0.3e.json")));
}
test "JSONTestSuite n_number_0.e1.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0.e1.json")));
}
test "JSONTestSuite n_number_0_capital_E+.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0_capital_E+.json")));
}
test "JSONTestSuite n_number_0_capital_E.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0_capital_E.json")));
}
test "JSONTestSuite n_number_0e+.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0e+.json")));
}
test "JSONTestSuite n_number_0e.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_0e.json")));
}
test "JSONTestSuite n_number_1.0e+.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_1.0e+.json")));
}
test "JSONTestSuite n_number_1.0e-.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_1.0e-.json")));
}
test "JSONTestSuite n_number_1.0e.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_1.0e.json")));
}
test "JSONTestSuite n_number_1_000.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_1_000.json")));
}
test "JSONTestSuite n_number_1eE2.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_1eE2.json")));
}
test "JSONTestSuite n_number_2.e+3.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_2.e+3.json")));
}
test "JSONTestSuite n_number_2.e-3.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_2.e-3.json")));
}
test "JSONTestSuite n_number_2.e3.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_2.e3.json")));
}
test "JSONTestSuite n_number_9.e+.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_9.e+.json")));
}
test "JSONTestSuite n_number_Inf.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_Inf.json")));
}
test "JSONTestSuite n_number_NaN.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_NaN.json")));
}
test "JSONTestSuite n_number_U+FF11_fullwidth_digit_one.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_U+FF11_fullwidth_digit_one.json")));
}
test "JSONTestSuite n_number_expression.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_expression.json")));
}
test "JSONTestSuite n_number_hex_1_digit.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_hex_1_digit.json")));
}
test "JSONTestSuite n_number_hex_2_digits.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_hex_2_digits.json")));
}
test "JSONTestSuite n_number_infinity.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_infinity.json")));
}
test "JSONTestSuite n_number_invalid+-.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_invalid+-.json")));
}
test "JSONTestSuite n_number_invalid-negative-real.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_invalid-negative-real.json")));
}
test "JSONTestSuite n_number_invalid-utf-8-in-bigger-int.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_invalid-utf-8-in-bigger-int.json")));
}
test "JSONTestSuite n_number_invalid-utf-8-in-exponent.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_invalid-utf-8-in-exponent.json")));
}
test "JSONTestSuite n_number_invalid-utf-8-in-int.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_invalid-utf-8-in-int.json")));
}
test "JSONTestSuite n_number_minus_infinity.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_minus_infinity.json")));
}
test "JSONTestSuite n_number_minus_sign_with_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_minus_sign_with_trailing_garbage.json")));
}
test "JSONTestSuite n_number_minus_space_1.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_minus_space_1.json")));
}
test "JSONTestSuite n_number_neg_int_starting_with_zero.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_neg_int_starting_with_zero.json")));
}
test "JSONTestSuite n_number_neg_real_without_int_part.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_neg_real_without_int_part.json")));
}
test "JSONTestSuite n_number_neg_with_garbage_at_end.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_neg_with_garbage_at_end.json")));
}
test "JSONTestSuite n_number_real_garbage_after_e.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_real_garbage_after_e.json")));
}
test "JSONTestSuite n_number_real_with_invalid_utf8_after_e.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_real_with_invalid_utf8_after_e.json")));
}
test "JSONTestSuite n_number_real_without_fractional_part.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_real_without_fractional_part.json")));
}
test "JSONTestSuite n_number_starting_with_dot.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_starting_with_dot.json")));
}
test "JSONTestSuite n_number_with_alpha.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_with_alpha.json")));
}
test "JSONTestSuite n_number_with_alpha_char.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_with_alpha_char.json")));
}
test "JSONTestSuite n_number_with_leading_zero.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_number_with_leading_zero.json")));
}
test "JSONTestSuite n_object_bad_value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_bad_value.json")));
}
test "JSONTestSuite n_object_bracket_key.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_bracket_key.json")));
}
test "JSONTestSuite n_object_comma_instead_of_colon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_comma_instead_of_colon.json")));
}
test "JSONTestSuite n_object_double_colon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_double_colon.json")));
}
test "JSONTestSuite n_object_emoji.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_emoji.json")));
}
test "JSONTestSuite n_object_garbage_at_end.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_garbage_at_end.json")));
}
test "JSONTestSuite n_object_key_with_single_quotes.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_key_with_single_quotes.json")));
}
test "JSONTestSuite n_object_lone_continuation_byte_in_key_and_trailing_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_lone_continuation_byte_in_key_and_trailing_comma.json")));
}
test "JSONTestSuite n_object_missing_colon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_missing_colon.json")));
}
test "JSONTestSuite n_object_missing_key.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_missing_key.json")));
}
test "JSONTestSuite n_object_missing_semicolon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_missing_semicolon.json")));
}
test "JSONTestSuite n_object_missing_value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_missing_value.json")));
}
test "JSONTestSuite n_object_no-colon.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_no-colon.json")));
}
test "JSONTestSuite n_object_non_string_key.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_non_string_key.json")));
}
test "JSONTestSuite n_object_non_string_key_but_huge_number_instead.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_non_string_key_but_huge_number_instead.json")));
}
test "JSONTestSuite n_object_repeated_null_null.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_repeated_null_null.json")));
}
test "JSONTestSuite n_object_several_trailing_commas.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_several_trailing_commas.json")));
}
test "JSONTestSuite n_object_single_quote.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_single_quote.json")));
}
test "JSONTestSuite n_object_trailing_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_trailing_comma.json")));
}
test "JSONTestSuite n_object_trailing_comment.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_trailing_comment.json")));
}
test "JSONTestSuite n_object_trailing_comment_open.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_trailing_comment_open.json")));
}
test "JSONTestSuite n_object_trailing_comment_slash_open.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_trailing_comment_slash_open.json")));
}
test "JSONTestSuite n_object_trailing_comment_slash_open_incomplete.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_trailing_comment_slash_open_incomplete.json")));
}
test "JSONTestSuite n_object_two_commas_in_a_row.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_two_commas_in_a_row.json")));
}
test "JSONTestSuite n_object_unquoted_key.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_unquoted_key.json")));
}
test "JSONTestSuite n_object_unterminated-value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_unterminated-value.json")));
}
test "JSONTestSuite n_object_with_single_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_with_single_string.json")));
}
test "JSONTestSuite n_object_with_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_object_with_trailing_garbage.json")));
}
test "JSONTestSuite n_single_space.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_single_space.json")));
}
test "JSONTestSuite n_string_1_surrogate_then_escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_1_surrogate_then_escape.json")));
}
test "JSONTestSuite n_string_1_surrogate_then_escape_u.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_1_surrogate_then_escape_u.json")));
}
test "JSONTestSuite n_string_1_surrogate_then_escape_u1.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_1_surrogate_then_escape_u1.json")));
}
test "JSONTestSuite n_string_1_surrogate_then_escape_u1x.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_1_surrogate_then_escape_u1x.json")));
}
test "JSONTestSuite n_string_accentuated_char_no_quotes.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_accentuated_char_no_quotes.json")));
}
test "JSONTestSuite n_string_backslash_00.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_backslash_00.json")));
}
test "JSONTestSuite n_string_escape_x.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_escape_x.json")));
}
test "JSONTestSuite n_string_escaped_backslash_bad.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_escaped_backslash_bad.json")));
}
test "JSONTestSuite n_string_escaped_ctrl_char_tab.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_escaped_ctrl_char_tab.json")));
}
test "JSONTestSuite n_string_escaped_emoji.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_escaped_emoji.json")));
}
test "JSONTestSuite n_string_incomplete_escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_incomplete_escape.json")));
}
test "JSONTestSuite n_string_incomplete_escaped_character.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_incomplete_escaped_character.json")));
}
test "JSONTestSuite n_string_incomplete_surrogate.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_incomplete_surrogate.json")));
}
test "JSONTestSuite n_string_incomplete_surrogate_escape_invalid.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_incomplete_surrogate_escape_invalid.json")));
}
test "JSONTestSuite n_string_invalid-utf-8-in-escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_invalid-utf-8-in-escape.json")));
}
test "JSONTestSuite n_string_invalid_backslash_esc.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_invalid_backslash_esc.json")));
}
test "JSONTestSuite n_string_invalid_unicode_escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_invalid_unicode_escape.json")));
}
test "JSONTestSuite n_string_invalid_utf8_after_escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_invalid_utf8_after_escape.json")));
}
test "JSONTestSuite n_string_leading_uescaped_thinspace.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_leading_uescaped_thinspace.json")));
}
test "JSONTestSuite n_string_no_quotes_with_bad_escape.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_no_quotes_with_bad_escape.json")));
}
test "JSONTestSuite n_string_single_doublequote.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_single_doublequote.json")));
}
test "JSONTestSuite n_string_single_quote.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_single_quote.json")));
}
test "JSONTestSuite n_string_single_string_no_double_quotes.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_single_string_no_double_quotes.json")));
}
test "JSONTestSuite n_string_start_escape_unclosed.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_start_escape_unclosed.json")));
}
test "JSONTestSuite n_string_unescaped_ctrl_char.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_unescaped_ctrl_char.json")));
}
test "JSONTestSuite n_string_unescaped_newline.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_unescaped_newline.json")));
}
test "JSONTestSuite n_string_unescaped_tab.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_unescaped_tab.json")));
}
test "JSONTestSuite n_string_unicode_CapitalU.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_unicode_CapitalU.json")));
}
test "JSONTestSuite n_string_with_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_string_with_trailing_garbage.json")));
}
test "JSONTestSuite n_structure_100000_opening_arrays.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_100000_opening_arrays.json")));
}
test "JSONTestSuite n_structure_U+2060_word_joined.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_U+2060_word_joined.json")));
}
test "JSONTestSuite n_structure_UTF8_BOM_no_data.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_UTF8_BOM_no_data.json")));
}
test "JSONTestSuite n_structure_angle_bracket_..json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_angle_bracket_..json")));
}
test "JSONTestSuite n_structure_angle_bracket_null.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_angle_bracket_null.json")));
}
test "JSONTestSuite n_structure_array_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_array_trailing_garbage.json")));
}
test "JSONTestSuite n_structure_array_with_extra_array_close.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_array_with_extra_array_close.json")));
}
test "JSONTestSuite n_structure_array_with_unclosed_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_array_with_unclosed_string.json")));
}
test "JSONTestSuite n_structure_ascii-unicode-identifier.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_ascii-unicode-identifier.json")));
}
test "JSONTestSuite n_structure_capitalized_True.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_capitalized_True.json")));
}
test "JSONTestSuite n_structure_close_unopened_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_close_unopened_array.json")));
}
test "JSONTestSuite n_structure_comma_instead_of_closing_brace.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_comma_instead_of_closing_brace.json")));
}
test "JSONTestSuite n_structure_double_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_double_array.json")));
}
test "JSONTestSuite n_structure_end_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_end_array.json")));
}
test "JSONTestSuite n_structure_incomplete_UTF8_BOM.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_incomplete_UTF8_BOM.json")));
}
test "JSONTestSuite n_structure_lone-invalid-utf-8.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_lone-invalid-utf-8.json")));
}
test "JSONTestSuite n_structure_lone-open-bracket.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_lone-open-bracket.json")));
}
test "JSONTestSuite n_structure_no_data.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_no_data.json")));
}
test "JSONTestSuite n_structure_null-byte-outside-string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_null-byte-outside-string.json")));
}
test "JSONTestSuite n_structure_number_with_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_number_with_trailing_garbage.json")));
}
test "JSONTestSuite n_structure_object_followed_by_closing_object.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_object_followed_by_closing_object.json")));
}
test "JSONTestSuite n_structure_object_unclosed_no_value.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_object_unclosed_no_value.json")));
}
test "JSONTestSuite n_structure_object_with_comment.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_object_with_comment.json")));
}
test "JSONTestSuite n_structure_object_with_trailing_garbage.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_object_with_trailing_garbage.json")));
}
test "JSONTestSuite n_structure_open_array_apostrophe.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_apostrophe.json")));
}
test "JSONTestSuite n_structure_open_array_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_comma.json")));
}
test "JSONTestSuite n_structure_open_array_object.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_object.json")));
}
test "JSONTestSuite n_structure_open_array_open_object.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_open_object.json")));
}
test "JSONTestSuite n_structure_open_array_open_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_open_string.json")));
}
test "JSONTestSuite n_structure_open_array_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_array_string.json")));
}
test "JSONTestSuite n_structure_open_object.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object.json")));
}
test "JSONTestSuite n_structure_open_object_close_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object_close_array.json")));
}
test "JSONTestSuite n_structure_open_object_comma.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object_comma.json")));
}
test "JSONTestSuite n_structure_open_object_open_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object_open_array.json")));
}
test "JSONTestSuite n_structure_open_object_open_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object_open_string.json")));
}
test "JSONTestSuite n_structure_open_object_string_with_apostrophes.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_object_string_with_apostrophes.json")));
}
test "JSONTestSuite n_structure_open_open.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_open_open.json")));
}
test "JSONTestSuite n_structure_single_eacute.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_single_eacute.json")));
}
test "JSONTestSuite n_structure_single_star.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_single_star.json")));
}
test "JSONTestSuite n_structure_trailing_#.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_trailing_#.json")));
}
test "JSONTestSuite n_structure_uescaped_LF_before_string.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_uescaped_LF_before_string.json")));
}
test "JSONTestSuite n_structure_unclosed_array.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unclosed_array.json")));
}
test "JSONTestSuite n_structure_unclosed_array_partial_null.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unclosed_array_partial_null.json")));
}
test "JSONTestSuite n_structure_unclosed_array_unfinished_false.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unclosed_array_unfinished_false.json")));
}
test "JSONTestSuite n_structure_unclosed_array_unfinished_true.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unclosed_array_unfinished_true.json")));
}
test "JSONTestSuite n_structure_unclosed_object.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unclosed_object.json")));
}
test "JSONTestSuite n_structure_unicode-identifier.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_unicode-identifier.json")));
}
test "JSONTestSuite n_structure_whitespace_U+2060_word_joiner.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_whitespace_U+2060_word_joiner.json")));
}
test "JSONTestSuite n_structure_whitespace_formfeed.json" {
    try std.testing.expectError(error.InvalidJson, json.validate(@embedFile("JSONTestSuite/test_parsing/n_structure_whitespace_formfeed.json")));
}
test "JSONTestSuite y_array_arraysWithSpaces.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_arraysWithSpaces.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_arraysWithSpaces.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_arraysWithSpaces.json"), unchanged);
}
test "JSONTestSuite y_array_empty-string.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_empty-string.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_empty-string.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_empty-string.json"), unchanged);
}
test "JSONTestSuite y_array_empty.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_empty.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_empty.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_empty.json"), unchanged);
}
test "JSONTestSuite y_array_ending_with_newline.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_ending_with_newline.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_ending_with_newline.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_ending_with_newline.json"), unchanged);
}
test "JSONTestSuite y_array_false.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_false.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_false.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_false.json"), unchanged);
}
test "JSONTestSuite y_array_heterogeneous.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_heterogeneous.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_heterogeneous.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_heterogeneous.json"), unchanged);
}
test "JSONTestSuite y_array_null.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_null.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_null.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_null.json"), unchanged);
}
test "JSONTestSuite y_array_with_1_and_newline.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_with_1_and_newline.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_with_1_and_newline.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_with_1_and_newline.json"), unchanged);
}
test "JSONTestSuite y_array_with_leading_space.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_with_leading_space.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_with_leading_space.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_with_leading_space.json"), unchanged);
}
test "JSONTestSuite y_array_with_several_null.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_with_several_null.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_with_several_null.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_with_several_null.json"), unchanged);
}
test "JSONTestSuite y_array_with_trailing_space.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_array_with_trailing_space.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_array_with_trailing_space.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_array_with_trailing_space.json"), unchanged);
}
test "JSONTestSuite y_number.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number.json"), unchanged);
}
test "JSONTestSuite y_number_0e+1.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_0e+1.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_0e+1.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_0e+1.json"), unchanged);
}
test "JSONTestSuite y_number_0e1.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_0e1.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_0e1.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_0e1.json"), unchanged);
}
test "JSONTestSuite y_number_after_space.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_after_space.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_after_space.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_after_space.json"), unchanged);
}
test "JSONTestSuite y_number_double_close_to_zero.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_double_close_to_zero.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_double_close_to_zero.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_double_close_to_zero.json"), unchanged);
}
test "JSONTestSuite y_number_int_with_exp.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_int_with_exp.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_int_with_exp.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_int_with_exp.json"), unchanged);
}
test "JSONTestSuite y_number_minus_zero.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_minus_zero.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_minus_zero.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_minus_zero.json"), unchanged);
}
test "JSONTestSuite y_number_negative_int.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_negative_int.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_negative_int.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_negative_int.json"), unchanged);
}
test "JSONTestSuite y_number_negative_one.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_negative_one.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_negative_one.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_negative_one.json"), unchanged);
}
test "JSONTestSuite y_number_negative_zero.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_negative_zero.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_negative_zero.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_negative_zero.json"), unchanged);
}
test "JSONTestSuite y_number_real_capital_e.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e.json"), unchanged);
}
test "JSONTestSuite y_number_real_capital_e_neg_exp.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_neg_exp.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_neg_exp.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_neg_exp.json"), unchanged);
}
test "JSONTestSuite y_number_real_capital_e_pos_exp.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_pos_exp.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_pos_exp.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_capital_e_pos_exp.json"), unchanged);
}
test "JSONTestSuite y_number_real_exponent.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_exponent.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_exponent.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_exponent.json"), unchanged);
}
test "JSONTestSuite y_number_real_fraction_exponent.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_fraction_exponent.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_fraction_exponent.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_fraction_exponent.json"), unchanged);
}
test "JSONTestSuite y_number_real_neg_exp.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_neg_exp.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_neg_exp.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_neg_exp.json"), unchanged);
}
test "JSONTestSuite y_number_real_pos_exponent.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_real_pos_exponent.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_real_pos_exponent.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_real_pos_exponent.json"), unchanged);
}
test "JSONTestSuite y_number_simple_int.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_simple_int.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_simple_int.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_simple_int.json"), unchanged);
}
test "JSONTestSuite y_number_simple_real.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_number_simple_real.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_number_simple_real.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_number_simple_real.json"), unchanged);
}
test "JSONTestSuite y_object.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object.json"), unchanged);
}
test "JSONTestSuite y_object_basic.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_basic.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_basic.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_basic.json"), unchanged);
}
test "JSONTestSuite y_object_duplicated_key.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key.json"), unchanged);
}
test "JSONTestSuite y_object_duplicated_key_and_value.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key_and_value.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key_and_value.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_duplicated_key_and_value.json"), unchanged);
}
test "JSONTestSuite y_object_empty.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_empty.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_empty.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_empty.json"), unchanged);
}
test "JSONTestSuite y_object_empty_key.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_empty_key.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_empty_key.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_empty_key.json"), unchanged);
}
test "JSONTestSuite y_object_escaped_null_in_key.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_escaped_null_in_key.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_escaped_null_in_key.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_escaped_null_in_key.json"), unchanged);
}
test "JSONTestSuite y_object_extreme_numbers.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_extreme_numbers.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_extreme_numbers.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_extreme_numbers.json"), unchanged);
}
test "JSONTestSuite y_object_long_strings.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_long_strings.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_long_strings.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_long_strings.json"), unchanged);
}
test "JSONTestSuite y_object_simple.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_simple.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_simple.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_simple.json"), unchanged);
}
test "JSONTestSuite y_object_string_unicode.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_string_unicode.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_string_unicode.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_string_unicode.json"), unchanged);
}
test "JSONTestSuite y_object_with_newlines.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_object_with_newlines.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_object_with_newlines.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_object_with_newlines.json"), unchanged);
}
test "JSONTestSuite y_string_1_2_3_bytes_UTF-8_sequences.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_1_2_3_bytes_UTF-8_sequences.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_1_2_3_bytes_UTF-8_sequences.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_1_2_3_bytes_UTF-8_sequences.json"), unchanged);
}
test "JSONTestSuite y_string_accepted_surrogate_pair.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pair.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pair.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pair.json"), unchanged);
}
test "JSONTestSuite y_string_accepted_surrogate_pairs.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pairs.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pairs.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_accepted_surrogate_pairs.json"), unchanged);
}
test "JSONTestSuite y_string_allowed_escapes.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_allowed_escapes.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_allowed_escapes.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_allowed_escapes.json"), unchanged);
}
test "JSONTestSuite y_string_backslash_and_u_escaped_zero.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_backslash_and_u_escaped_zero.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_backslash_and_u_escaped_zero.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_backslash_and_u_escaped_zero.json"), unchanged);
}
test "JSONTestSuite y_string_backslash_doublequotes.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_backslash_doublequotes.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_backslash_doublequotes.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_backslash_doublequotes.json"), unchanged);
}
test "JSONTestSuite y_string_comments.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_comments.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_comments.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_comments.json"), unchanged);
}
test "JSONTestSuite y_string_double_escape_a.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_double_escape_a.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_double_escape_a.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_double_escape_a.json"), unchanged);
}
test "JSONTestSuite y_string_double_escape_n.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_double_escape_n.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_double_escape_n.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_double_escape_n.json"), unchanged);
}
test "JSONTestSuite y_string_escaped_control_character.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_escaped_control_character.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_escaped_control_character.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_escaped_control_character.json"), unchanged);
}
test "JSONTestSuite y_string_escaped_noncharacter.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_escaped_noncharacter.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_escaped_noncharacter.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_escaped_noncharacter.json"), unchanged);
}
test "JSONTestSuite y_string_in_array.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_in_array.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_in_array.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_in_array.json"), unchanged);
}
test "JSONTestSuite y_string_in_array_with_leading_space.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_in_array_with_leading_space.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_in_array_with_leading_space.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_in_array_with_leading_space.json"), unchanged);
}
test "JSONTestSuite y_string_last_surrogates_1_and_2.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_last_surrogates_1_and_2.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_last_surrogates_1_and_2.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_last_surrogates_1_and_2.json"), unchanged);
}
test "JSONTestSuite y_string_nbsp_uescaped.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_nbsp_uescaped.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_nbsp_uescaped.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_nbsp_uescaped.json"), unchanged);
}
test "JSONTestSuite y_string_nonCharacterInUTF-8_U+10FFFF.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+10FFFF.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+10FFFF.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+10FFFF.json"), unchanged);
}
test "JSONTestSuite y_string_nonCharacterInUTF-8_U+FFFF.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+FFFF.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+FFFF.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_nonCharacterInUTF-8_U+FFFF.json"), unchanged);
}
test "JSONTestSuite y_string_null_escape.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_null_escape.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_null_escape.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_null_escape.json"), unchanged);
}
test "JSONTestSuite y_string_one-byte-utf-8.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_one-byte-utf-8.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_one-byte-utf-8.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_one-byte-utf-8.json"), unchanged);
}
test "JSONTestSuite y_string_pi.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_pi.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_pi.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_pi.json"), unchanged);
}
test "JSONTestSuite y_string_reservedCharacterInUTF-8_U+1BFFF.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_reservedCharacterInUTF-8_U+1BFFF.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_reservedCharacterInUTF-8_U+1BFFF.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_reservedCharacterInUTF-8_U+1BFFF.json"), unchanged);
}
test "JSONTestSuite y_string_simple_ascii.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_simple_ascii.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_simple_ascii.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_simple_ascii.json"), unchanged);
}
test "JSONTestSuite y_string_space.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_space.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_space.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_space.json"), unchanged);
}
test "JSONTestSuite y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json"), unchanged);
}
test "JSONTestSuite y_string_three-byte-utf-8.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_three-byte-utf-8.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_three-byte-utf-8.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_three-byte-utf-8.json"), unchanged);
}
test "JSONTestSuite y_string_two-byte-utf-8.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_two-byte-utf-8.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_two-byte-utf-8.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_two-byte-utf-8.json"), unchanged);
}
test "JSONTestSuite y_string_u+2028_line_sep.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_u+2028_line_sep.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_u+2028_line_sep.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_u+2028_line_sep.json"), unchanged);
}
test "JSONTestSuite y_string_u+2029_par_sep.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_u+2029_par_sep.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_u+2029_par_sep.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_u+2029_par_sep.json"), unchanged);
}
test "JSONTestSuite y_string_uEscape.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_uEscape.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_uEscape.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_uEscape.json"), unchanged);
}
test "JSONTestSuite y_string_uescaped_newline.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_uescaped_newline.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_uescaped_newline.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_uescaped_newline.json"), unchanged);
}
test "JSONTestSuite y_string_unescaped_char_delete.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unescaped_char_delete.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unescaped_char_delete.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unescaped_char_delete.json"), unchanged);
}
test "JSONTestSuite y_string_unicode.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode.json"), unchanged);
}
test "JSONTestSuite y_string_unicodeEscapedBackslash.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicodeEscapedBackslash.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicodeEscapedBackslash.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicodeEscapedBackslash.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_2.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_2.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_2.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_2.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+10FFFE_nonchar.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+10FFFE_nonchar.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+10FFFE_nonchar.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+10FFFE_nonchar.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+1FFFE_nonchar.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+1FFFE_nonchar.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+1FFFE_nonchar.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+1FFFE_nonchar.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+2064_invisible_plus.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+2064_invisible_plus.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+2064_invisible_plus.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+2064_invisible_plus.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+FDD0_nonchar.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FDD0_nonchar.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FDD0_nonchar.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FDD0_nonchar.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_U+FFFE_nonchar.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FFFE_nonchar.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FFFE_nonchar.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_U+FFFE_nonchar.json"), unchanged);
}
test "JSONTestSuite y_string_unicode_escaped_double_quote.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_escaped_double_quote.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_unicode_escaped_double_quote.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_unicode_escaped_double_quote.json"), unchanged);
}
test "JSONTestSuite y_string_utf8.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_utf8.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_utf8.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_utf8.json"), unchanged);
}
test "JSONTestSuite y_string_with_del_character.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_string_with_del_character.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_string_with_del_character.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_string_with_del_character.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_false.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_false.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_false.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_false.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_int.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_int.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_int.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_int.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_negative_real.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_negative_real.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_negative_real.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_negative_real.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_null.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_null.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_null.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_null.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_string.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_string.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_string.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_string.json"), unchanged);
}
test "JSONTestSuite y_structure_lonely_true.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_true.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_lonely_true.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_lonely_true.json"), unchanged);
}
test "JSONTestSuite y_structure_string_empty.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_string_empty.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_string_empty.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_string_empty.json"), unchanged);
}
test "JSONTestSuite y_structure_trailing_newline.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_trailing_newline.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_trailing_newline.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_trailing_newline.json"), unchanged);
}
test "JSONTestSuite y_structure_true_in_array.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_true_in_array.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_true_in_array.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_true_in_array.json"), unchanged);
}
test "JSONTestSuite y_structure_whitespace_array.json" {
    try json.validate(@embedFile("JSONTestSuite/test_parsing/y_structure_whitespace_array.json"));
    var plan = try json.EditPlan.init(std.testing.allocator, @embedFile("JSONTestSuite/test_parsing/y_structure_whitespace_array.json"), &.{""});
    defer plan.deinit();
    const unchanged = try plan.apply(std.testing.allocator, &.{try plan.original(0)});
    defer std.testing.allocator.free(unchanged);
    try std.testing.expectEqualStrings(@embedFile("JSONTestSuite/test_parsing/y_structure_whitespace_array.json"), unchanged);
}
test "JSONTestSuite implementation-defined i_number_double_huge_neg_exp.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_double_huge_neg_exp.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_huge_exp.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_huge_exp.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_neg_int_huge_exp.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_neg_int_huge_exp.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_pos_double_huge_exp.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_pos_double_huge_exp.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_real_neg_overflow.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_real_neg_overflow.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_real_pos_overflow.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_real_pos_overflow.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_real_underflow.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_real_underflow.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_too_big_neg_int.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_too_big_neg_int.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_too_big_pos_int.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_too_big_pos_int.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_number_very_big_negative_int.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_number_very_big_negative_int.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_object_key_lone_2nd_surrogate.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_object_key_lone_2nd_surrogate.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_1st_surrogate_but_2nd_missing.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_1st_surrogate_but_2nd_missing.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_1st_valid_surrogate_2nd_invalid.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_1st_valid_surrogate_2nd_invalid.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_UTF-16LE_with_BOM.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_UTF-16LE_with_BOM.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_UTF-8_invalid_sequence.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_UTF-8_invalid_sequence.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_UTF8_surrogate_U+D800.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_UTF8_surrogate_U+D800.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_incomplete_surrogate_and_escape_valid.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_incomplete_surrogate_and_escape_valid.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_incomplete_surrogate_pair.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_incomplete_surrogate_pair.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_incomplete_surrogates_escape_valid.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_incomplete_surrogates_escape_valid.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_invalid_lonely_surrogate.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_invalid_lonely_surrogate.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_invalid_surrogate.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_invalid_surrogate.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_invalid_utf-8.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_invalid_utf-8.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_inverted_surrogates_U+1D11E.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_inverted_surrogates_U+1D11E.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_iso_latin_1.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_iso_latin_1.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_lone_second_surrogate.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_lone_second_surrogate.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_lone_utf8_continuation_byte.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_lone_utf8_continuation_byte.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_not_in_unicode_range.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_not_in_unicode_range.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_overlong_sequence_2_bytes.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_overlong_sequence_2_bytes.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_overlong_sequence_6_bytes.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_overlong_sequence_6_bytes.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_overlong_sequence_6_bytes_null.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_overlong_sequence_6_bytes_null.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_truncated-utf-8.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_truncated-utf-8.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_utf16BE_no_BOM.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_utf16BE_no_BOM.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_string_utf16LE_no_BOM.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_string_utf16LE_no_BOM.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_structure_500_nested_arrays.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_structure_500_nested_arrays.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
test "JSONTestSuite implementation-defined i_structure_UTF-8_BOM_empty_object.json" {
    json.validate(@embedFile("JSONTestSuite/test_parsing/i_structure_UTF-8_BOM_empty_object.json")) catch |err| switch (err) {
        error.InvalidJson => {},
        else => return err,
    };
}
