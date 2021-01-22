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

  def empty_lines_check
    @file_lines.each_with_index do |_line, index|
      if @file_lines[index].strip.empty? && !@file_lines[index - 1].include?('}')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingEmptyLines:   Trailing blank line detected.\n "
      end
    end
  end

  def semicolon_check
    @file_lines.each_with_index do |line, index|
      if line.include?(':') && line.include?('  ')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingMissingSemicolon:   Expected a semicolon.\n "
      end
    end
  end
end
