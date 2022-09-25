require 'rspec'
require './lib/night_writer'
require './lib/braille_translator'

RSpec.describe BrailleTranslator do
  describe '#initialize' do
    it "exists" do
      translator = BrailleTranslator.new
      expect(translator).to be_an_instance_of(BrailleTranslator)
    end
    it "has readable attributes" do
      translator = BrailleTranslator.new
      expect(translator.lowercase["a"]).to eq(["0.", "..", ".."])
    end
  end
  describe '#char_to_braille' do
    it "can return a string of text translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("hello")).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end
    it "can return all lowercase letters translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("abcdefghijklmnopqrstuvwxyz")).to eq("0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000.\n..0....0.00.00000.00..0....0.00.00000.00..0.00...0.0\n....................0.0.0.0.0.0.0.0.0.0.0000.0000000")
    end
  end
  describe '#create_braille_string' do
    it "can put together a string representation of braille lines" do
      translator = BrailleTranslator.new
      braille_lines = {1=> "0.0.0.0.0.", 2 => "00.00.0..0", 3 => "....0.0.0."}
      braille_char_num = 5
      expect(translator.create_braille_string(braille_lines, braille_char_num)).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end
    it "can ensure no line of the braille file is wider than 40 Braille characters" do
      translator = BrailleTranslator.new
      braille_lines ={1 => "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
                      2 => "..................................................................................",
                      3 => ".................................................................................."}
      braille_char_num = 41
      expect(translator.create_braille_string(braille_lines, braille_char_num).length).to eq(251)
    end
  end
end
