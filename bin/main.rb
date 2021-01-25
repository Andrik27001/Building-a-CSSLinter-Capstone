require_relative '../lib/linter'

test = CSSLinter.new('style.css')
test.white_spaces_check
test.empty_lines_check
test.semicolon_check
test.newline_after_colon_check
test.indentation_check
test.open_close_block_check
test.total_errors
