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
      expect(translator.lowercase[:a]).to eq(["0.", "..", ".."])
    end
  end
  describe '#char_to_braille' do
    it "can return a string of text translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("hello")).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end
  end
end
