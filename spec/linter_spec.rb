require_relative '../lib/linter'

describe CSSLinter do
  linter_instance = CSSLinter.new('style.css')

  describe '#white_spaces_check' do
    it 'Returns Trailing whitespace detected ' do
      expect(linter_instance.white_spaces_check).to eql(linter_instance.errors)
    end
  end
  
  describe '#empty_lines_check' do
    it 'Returns Trailing blank line detected' do
      expect(linter_instance.empty_lines_check).to eql(linter_instance.errors)
    end
  end

  describe '#semicolon_check' do
    it 'Returns Expected a semicolon' do
      expect(linter_instance.semicolon_check).to eql(linter_instance.errors)
    end
  end
end