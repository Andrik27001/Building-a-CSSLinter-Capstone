require 'colorize'

class CSSLinter
  def initialize(file)
    @file = file
    @file_lines = File.readlines(@file)
    @symbols = %w[{ } ,]
    @errors = []
  end

  def white_spaces_check
    @file_lines.each_with_index do |line, index|
      if line[-2] == ' '
        @error = " #{@file}/Row #{index + 1}  ||  Layout/TrailingWhitespace:   Trailing whitespace detected.\n "
        @errors << @error
      end
    end
    @error
  end

  def empty_lines_check
    @file_lines.each_with_index do |_line, index|
      if @file_lines[index].strip.empty? && !@file_lines[index - 1].include?('}')
        @error = " #{@file}/Row #{index + 1}  ||  Layout/TrailingEmptyLines:   Trailing blank line detected.\n "
        @errors << @error
      end
    end
    @error
  end

  def semicolon_check
    @file_lines.each_with_index do |line, index|
      unless line.include?('{') || line.include?('}') || line.include?(';') || line.strip.empty? || line.include?(',')
        @error = " #{@file}/Row #{index + 1}  ||  Layout/TrailingMissingSemicolon:   Expected a semicolon.\n "
        @errors << @error
      end
    end
    @error
  end

  def newline_after_colon_check
    @file_lines.each_with_index do |line, index|
      if line.include?('{') && line.include?(',')
        @error = " #{@file}/Row #{index + 1}  ||  Layout/TrailingNewline:   Expected a newline after \",\".\n "
        @errors << @error
      end
    end
    @error
  end

  def indentation_check
    @file_lines.each_with_index do |line, index|
      unless line.include?('{') || line.include?('}') || line.include?('  ') || line.strip.empty? || line.include?(',')
        @error = " #{@file}/Row #{index + 1}  ||  Layout/TrailingIndentation:   Expected indentation of 2 spaces.\n "
        @errors << @error
      end
    end
    @error
  end

  def open_close_block_check
    @open = 0
    @close = 0
    @file_lines.each do |line|
      line.split(' ').each do |value|
        @open += 1 if value.include?('{')
        @close += 1 if value.include?('}')
      end
    end
    if @close > @open
      @error = " #{@file}  ||  Lint/Syntax:   Unexpected token '}'.\n "
      @errors << @error
    elsif @open > @close
      @error = " #{@file}  ||  Lint/Syntax:   Unclosed block.\n "
      @errors << @error
    end
    @error
  end

  def total_errors
    @offense = 0
    @offense = @errors.size == 1 ? 'offense' : 'offenses'
    if @errors.empty?
      puts
      puts " 1 file inspected, #{@errors.size} #{@offense} detected.".colorize(:green)
    else
      puts @errors
      puts " 1 file inspected, #{@errors.size} #{@offense} detected.".colorize(:red)
    end
  end
end
