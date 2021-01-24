require 'colorize'

class CSSLinter

  attr_reader :errors

  private

  def initialize(file)
    @file = file
    @file_lines = File.readlines(@file)
    @symbols = %w[{ } ,]
    @errors = []
  end

  public

  def white_spaces_check
    @file_lines.each_with_index do |line, index|
      if line[-2] == ' '
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingWhitespace:   Trailing whitespace detected.\n "
      end
    end
    @errors
  end

  def empty_lines_check
    @file_lines.each_with_index do |_line, index|
      if @file_lines[index].strip.empty? && !@file_lines[index - 1].include?('}')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingEmptyLines:   Trailing blank line detected.\n "
      end
    end
    @errors
  end

  def semicolon_check
    @file_lines.each_with_index do |line, index|
      unless line.include?('{') || line.include?('}') || line.include?(';') || line.strip.empty? || line.include?(',')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingMissingSemicolon:   Expected a semicolon.\n "
      end
    end
    @errors
  end

  def newline_after_colon_check
    @file_lines.each_with_index do |line, index|
      if line.include?('{') && line.include?(',')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingNewline:   Expected a newline after \",\".\n "
      end
    end
    @errors
  end

  def indentation_check
    @file_lines.each_with_index do |line, index|
      unless line.include?('{') || line.include?('}') || line.include?('  ') || line.strip.empty? || line.include?(',')
        @errors << " #{@file}/Row #{index + 1}  ||  Layout/TrailingIndentation:   Expected indentation of 2 spaces.\n "
      end
    end
    @errors
  end

  def open_close_block_check
    @open = 0
    @close = 0
    @file_lines.each do |line|
      @open += 1 if line.include? '{'
      @close += 1 if line.include? '}'
    end
    @errors << " #{@line}/  ||  Lint/Syntax:   Expected closing bracket.\n " if @close > @open
    @errors << " #{@file}/  ||  Lint/Syntax:   Unclosed block.\n " if @open > @close
    @errors
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
