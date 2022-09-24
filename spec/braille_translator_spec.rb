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
end
