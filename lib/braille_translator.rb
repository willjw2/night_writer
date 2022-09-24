class BrailleTranslator
  attr_reader :lowercase
  def initialize
    @lowercase = {
      a: ["0.", "..", ".."],
      b: ["0.", "0.", ".."],
      c: ["00", "..", ".."],
      d: ["00", ".0", ".."],
      e: ["0.", ".0", ".."],
      f: ["00", "0.", ".."],
      g: ["00", "00", ".."],
      h: ["0.", "00", ".."],
      i: [".0", "0.", ".."],
      j: [".0", "00", ".."],
      k: ["0.", "..", "0."],
      l: ["0.", "0.", "0."],
      m: ["00", "..", "0."],
      n: ["00", ".0", "0."],
      o: ["0.", ".0", "0."],
      p: ["00", "0.", "0."],
      q: ["00", "00", "0."],
      r: ["0.", "00", "0."],
      s: [".0", "0.", "0."],
      t: [".0", "00", "0."],
      u: ["0.", "..", "00"],
      v: ["0.", "0.", "00"],
      w: [".0", "00", ".0"],
      x: ["00", "..", "00"],
      y: ["00", ".0", "00"],
      z: ["0.", ".0", "00"],
      " ": ["..", "..", ".."]
    }
  end
  def char_to_braille(text)
    braille_string = String.new
    text.each_char do |char|
      braille_string += @lowercase[char.to_sym][0]
    end
    braille_string += "\n"
    text.each_char do |char|
      braille_string += @lowercase[char.to_sym][1]
    end
    braille_string += "\n"
    text.each_char do |char|
      braille_string += @lowercase[char.to_sym][2]
    end
    braille_string
  end
end

braille_translator = BrailleTranslator.new
require "pry"; binding.pry
