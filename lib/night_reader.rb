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

  def get_file_characters
    read_lines = File.readlines(@braille_file)
    read_text = read_lines.join
    read_text.gsub!("\n", " ")
    file_characters = (read_text.length - read_text.count(" ")) / 6
  end

  def get_file_braille_array
    #WIP
    read_lines = File.readlines(@braille_file)
    read_text = read_lines.join
    read_text.gsub!("\n", " ")
    braille_array = read_text.split
    braille_array = braille_array.map do |braille|
      braille.chars.each_slice(2).map(&:join)
    end
    if braille_array.length > 3
      braille_array = combine_braille_array(braille_array)
    end
    braille_array
  end

  def combine_braille_array(braille_array)
    if braille_array.length > 3
      braille_array[3..].each.with_index(4) do |line, index|
        if index % 3 == 1
          braille_array[0] += line
        elsif index % 3 == 2
          braille_array[1] += line
        elsif index % 3 == 0
          braille_array[2] += line
        end
      end
      combined_array = [braille_array[0], braille_array[1], braille_array[2]]
    end
    combined_array
  end
  
  def write_to_file
    text_translation = braille_to_text(get_file_braille_array)
    File.open(@text_file, "w+") do |file|
      file.write(text_translation)
      file.close
    end
  end
end

#ruby lib/night_read.rb braille.txt new_message.txt
