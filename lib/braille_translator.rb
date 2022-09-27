class BrailleTranslator
  attr_reader :lowercase
  def initialize
    @lowercase = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }
    @uppercase = {
      "A" => ["..0.", "....", ".0.."],
      "B" => ["..0.", "..0.", ".0.."],
      "C" => ["..00", "....", ".0.."],
      "D" => ["..00", "...0", ".0.."],
      "E" => ["..0.", "...0", ".0.."],
      "F" => ["..00", "..0.", ".0.."],
      "G" => ["..00", "..00", ".0.."],
      "H" => ["..0.", "..00", ".0.."],
      "I" => ["...0", "..0.", ".0.."],
      "J" => ["...0", "..00", ".0.."],
      "K" => ["..0.", "....", ".00."],
      "L" => ["..0.", "..0.", ".00."],
      "M" => ["..00", "....", ".00."],
      "N" => ["..00", "...0", ".00."],
      "O" => ["..0.", "...0", ".00."],
      "P" => ["..00", "..0.", ".00."],
      "Q" => ["..00", "..00", ".00."],
      "R" => ["..0.", "..00", ".00."],
      "S" => ["...0", "..0.", ".00."],
      "T" => ["...0", "..00", ".00."],
      "U" => ["..0.", "....", ".000"],
      "V" => ["..0.", "..0.", ".000"],
      "W" => ["...0", "..00", ".0.0"],
      "X" => ["..00", "....", ".000"],
      "Y" => ["..00", "...0", ".000"],
      "Z" => ["..0.", "...0", ".000"],
    }
    #WIP
    @contractions = {
      " a " => ["..0...", "......", "......"],
      " but " => ["..0...", "..0...", "......"],
      " can " => ["..00..", "......", "......"]
    }
    @numbers = {
      "1" => ["0.", "..", ".."],
      "2" => ["0.", "0.", ".."],
      "3" => ["00", "..", ".."],
      "4" => ["00", ".0", ".."],
      "5" => ["0.", ".0", ".."],
      "6" => ["00", "0.", ".."],
      "7" => ["00", "00", ".."],
      "8" => ["0.", "00", ".."],
      "9" => [".0", "0.", ".."],
      "0" => [".0", "00", ".."],
      "#" => [".0", ".0", "00"]
    }
  end

  def char_to_braille(text)
    braille_lines = {1 => "", 2 => "", 3 => ""}
    braille_char_num = 0

    text.each_char.with_index do |char, index|
      if char.ord.between?(97, 122) || char.ord == 32
        braille_lines[1] += @lowercase[char][0]
        braille_lines[2] += @lowercase[char][1]
        braille_lines[3] += @lowercase[char][2]
        braille_char_num += 1
      # elsif char.ord.between?(65, 90)
      #   braille_lines[1] += @uppercase[char][0]
      #   braille_lines[2] += @uppercase[char][1]
      #   braille_lines[3] += @uppercase[char][2]
      #   braille_char_num += 2
      # elsif char.ord.between?(48, 57)
      #   if index - 1 >= 0 && text[index-1].ord.between?(48, 57)
      #     braille_lines[1] += @numbers[char][0]
      #     braille_lines[2] += @numbers[char][1]
      #     braille_lines[3] += @numbers[char][2]
      #     braille_char_num += 1
      #   else
      #     braille_lines[1] += @numbers["#"][0]
      #     braille_lines[1] += @numbers["#"][1]
      #     braille_lines[1] += @numbers["#"][2]
      #     braille_lines[1] += @numbers[char][0]
      #     braille_lines[2] += @numbers[char][1]
      #     braille_lines[3] += @numbers[char][2]
      #     braille_char_num += 2
      #   end
      end
    end
    create_braille_string(braille_lines, braille_char_num)
  end

  def create_braille_string(braille_lines, braille_char_num)
    braille_string = String.new
    if braille_char_num > 40
      #WIP
      rows = braille_char_num / 40
      extra_chars = braille_char_num % 40
      rows.times do |row_num|
        start_indice = row_num * 80
        end_indice = ((row_num + 1) * 80) - 1
        braille_string += braille_lines[1][start_indice..end_indice]
        braille_string += "\n"
        braille_string += braille_lines[2][start_indice..end_indice]
        braille_string += "\n"
        braille_string += braille_lines[3][start_indice..end_indice]
        braille_string += "\n"
      end
      start_indice = (rows * 80)
      braille_string += braille_lines[1][start_indice..]
      braille_string += "\n"
      braille_string += braille_lines[2][start_indice..]
      braille_string += "\n"
      braille_string += braille_lines[3][start_indice..]
    else
      braille_string += braille_lines[1]
      braille_string += "\n"
      braille_string += braille_lines[2]
      braille_string += "\n"
      braille_string += braille_lines[3]
    end
    braille_string
  end

  def braille_to_text(braille_array)
    text_string = String.new
    braille_array[0].length.times.with_index do |index|
      letter = @lowercase.key([braille_array[0][index], braille_array[1][index], braille_array[2][index]])
      text_string << letter
    end
    text_string
  end
end

# translator = BrailleTranslator.new
# require "pry"; binding.pry

#def char_to_braille
# braille_string = String.new
# text.each_char do |char|
#   braille_string += @lowercase[char.to_sym][0]
# end
# braille_string += "\n"
# text.each_char do |char|
#   braille_string += @lowercase[char.to_sym][1]
# end
# braille_string += "\n"
# text.each_char do |char|
#   braille_string += @lowercase[char.to_sym][2]
# end
# braille_string
#end
