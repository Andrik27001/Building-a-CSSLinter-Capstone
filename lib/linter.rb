class CSSLinter
  def initialize(file)
    @file = file
    @file_lines = File.readlines(@file)
  end

  def white_spaces_check
    @file_lines.each_with_index do |str, index|
      puts "White space detected on line #{index + 1}" if str[-2] == ' '
    end
  end
end
