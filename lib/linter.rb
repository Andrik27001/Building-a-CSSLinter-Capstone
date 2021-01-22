class CSSLinter
  def initialize(file)
    @file = file
    @file_lines = File.readlines(@file)
    @symbols = %w[{ }]
    @errors = []
  end

  def white_spaces_check
    @file_lines.each_with_index do |line, index|
      if line[-2] == ' '
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingWhitespace:   Trailing whitespace detected.\n "
      end
    end
  end
end
