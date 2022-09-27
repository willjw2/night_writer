require_relative 'braille_translator'

class NightWriter < BrailleTranslator
  def initialize (text_file, braille_file)
    @text_file = text_file
    @braille_file = braille_file
    super()
  end

  def print_confirmation
    puts "Created '#{@braille_file}' containing #{get_file_text.length} characters"
  end

  def get_file_text
    read_lines = File.readlines(@text_file)
    read_text = read_lines.join
    read_text.gsub!("\n", " ")
    read_text.rstrip
  end

  def write_to_file
    braille_string = char_to_braille(self.get_file_text)

    File.open(@braille_file, "w+") do |file|
      file.write(braille_string)
      file.close
    end
    print_confirmation
    true
  end
end

#ruby night_write.rb message.txt braille.txt
#message = File.readlines("./docs/#{ARGV[0]}").map(&:chomp).join
