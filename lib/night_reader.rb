require_relative 'braille_translator'


class NightReader < BrailleTranslator
  def initialize (braille_file, text_file)
    @braille_file = braille_file
    @text_file = text_file
    super()
  end

  def print_confirmation
    puts "Created '#{@text_file}' containing #{get_file_characters} characters"
  end

  # def get_file_braille
  #   #WIP
  #   read_lines = File.readlines(@braille_file)
  #   read_text = read_lines.join
  #   read_text.gsub!("\n", " ")
  # end

  def get_file_characters
    read_lines = File.readlines(@braille_file)
    read_text = read_lines.join
    read_text.gsub!("\n", " ")
    file_characters = (read_text.length - read_text.count(" ")) / 6
  end
end
