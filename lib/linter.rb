class CSSLinter
  def initialize(file)
    @file = file
    @file_lines = File.readlines(@file)
  end

  def white_spaces_check
    @file_lines.each_with_index do |line, index|
      puts " #{@file}/Row #{index + 1}: Layout/TrailingWhitespace: Trailing whitespace detected." if line[-2] == ' '
    end
  end

  def empty_lines_check
    @file_lines.each_with_index do |line, index|
      puts " #{@file}/Row #{index + 1}: Layout/TrailingEmptyLines: Trailing blank line detected." if line.strip.empty?
    end
  end

  def open_close_block_check
    @open = 0
    @close = 0
    @file_lines.each_with_index do |line, _index|
      @open += 1 if line.split("").map { |a| a == '{' }.length
      @close += 1 if line.split("").map { |a| a == '}' }.length
      puts @close
      puts @open
    end
    puts " #{@line}/Lint/Syntax: Expected closing bracket." if @close > @open
    puts " #{@file}/Lint/Syntax: Unclosed block." if @open > @close
  end
end
