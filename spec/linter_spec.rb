require_relative '../lib/linter'

describe CSSLinter do
  linter_instance = CSSLinter.new('style.css')

  describe '#white_spaces_check' do
    message = " style.css/Row 9  ||  Layout/TrailingWhitespace:   Trailing whitespace detected.\n "
    it 'Returns Trailing whitespace detected ' do
      expect(linter_instance.white_spaces_check).to eql(message)
    end
  end

  describe '#empty_lines_check' do
    message = " style.css/Row 2  ||  Layout/TrailingEmptyLines:   Trailing blank line detected.\n "
    it 'Returns Trailing blank line detected' do
      expect(linter_instance.empty_lines_check).to eql(message)
    end
  end

  describe '#semicolon_check' do
    message = " style.css/Row 3  ||  Layout/TrailingMissingSemicolon:   Expected a semicolon.\n "
    it 'Returns Expected a semicolon' do
      expect(linter_instance.semicolon_check).to eql(message)
    end
  end

  describe '#newline_after_colon_check' do
    message = " style.css/Row 7  ||  Layout/TrailingNewline:   Expected a newline after \",\".\n "
    it 'Returns Expected a newline after ,' do
      expect(linter_instance.newline_after_colon_check).to eql(message)
    end
  end

  describe '#indentation_check' do
    message = " style.css/Row 3  ||  Layout/TrailingIndentation:   Expected indentation of 2 spaces.\n "
    it 'Returns Expected indentation of 2 spaces' do
      expect(linter_instance.indentation_check).to eql(message)
    end
  end

  describe '#open_close_block_check' do
    it 'Returns Missing bracket error' do
      expect(linter_instance.open_close_block_check).to eql(" style.css  ||  Lint/Syntax:   Unexpected token '}'.\n ")
    end
  end
end
