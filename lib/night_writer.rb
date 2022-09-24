
class NightWriter
  def initialize (text_file, braille_file)
    @text_file = text_file
    @braille_file = braille_file
  end

  def print_confirmation
    puts "Created '#{@braille_file}' containing #{get_file_char_length} characters"
  end

  def get_file_char_length
    read_lines = File.readlines(@text_file)
    read_text = read_lines.join
    char_length = read_text.length
  end
end

#message = File.readlines("./docs/#{ARGV[0]}").map(&:chomp).join
