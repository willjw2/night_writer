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
    it "can return a string of lowercase text translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("hello")).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end
    it "can return capital letters translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("Hello")).to eq("..0.0.0.0.0.\n..00.00.0..0\n.0....0.0.0.")
    end
    it "can return numbers translated to braille" do
      translator = BrailleTranslator.new
      expect(translator.char_to_braille("123")).to eq(".00.0.00\n.0..0...\n00......")
    end
  end
  describe '#lowercase to braille' do
    it "can add lowercase characters to a braille_lines hash" do
      translator = BrailleTranslator.new
      translator.char_to_braille("")
      expect(translator.lowercase_to_braille("a")).to eq({1=>"0.", 2=>"..", 3=>".."})
    end
  end
  describe '#capitals to braille' do
    it "can add capital characters to a braille_lines hash" do
      translator = BrailleTranslator.new
      translator.char_to_braille("")
      expect(translator.capitals_to_braille("A")).to eq({1=>"..0.", 2=>"....", 3=>".0.."})
    end
  end
  describe '#numbers_to_braille' do
    it "can add numbers to a braille_lines hash" do
      translator = BrailleTranslator.new
      translator.char_to_braille("")
      expect(translator.numbers_to_braille("1", 0, nil)).to eq({1=>".00.", 2=>".0..", 3=>"00.."})
    end
  end
  describe '#create_braille_string' do
    it "can put together a string representation of braille lines" do
      translator = BrailleTranslator.new
      braille_lines = {1=> "0.0.0.0.0.", 2 => "00.00.0..0", 3 => "....0.0.0."}
      braille_char_num = 5
      expect(translator.create_braille_string(braille_lines, braille_char_num)).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end
  end
  describe '#create_long_braille_string' do
    it "can ensure no line of the braille file is wider than 40 Braille characters" do
      translator = BrailleTranslator.new
      braille_lines ={1 => "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.",
                      2 => "..................................................................................",
                      3 => ".................................................................................."}
      braille_char_num = 41
      expect(translator.create_braille_string(braille_lines, braille_char_num).length).to eq(251)
    end
  end
  describe '#braille_to_text' do
    it "can convert a braille array into a string of text" do
      translator = BrailleTranslator.new
      text = translator.braille_to_text([["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]])
      expect(text).to eq("hello")
    end
    it "can convert a braille array with numbers into text" do
      translator = BrailleTranslator.new
      text = translator.braille_to_text([[".0", "0.", "0.", "00"], [".0", "..", "0.", ".."], ["00", "..", "..", ".."]])
      expect(text).to eq("123")
    end
    it "can convert a braille array with capitals into text" do
      translator = BrailleTranslator.new
      text = translator.braille_to_text([["..", "0.", "0.", "00"], ["..", "00", ".0", ".0"], [".0", "..", "..", "00"]])
      expect(text).to eq("Hey")
    end
  end
  describe '#add_to_text_string' do
    it "can add translated text to a text string" do
      translator = BrailleTranslator.new
      translator.braille_to_text([[],[],[]])
      text = translator.add_to_text_string(["0.", "..", ".."], [["0."], [".."], [".."]], 0)
      expect(text).to eq("a")
    end
  end
  describe '#get_braille_char_array' do
    it "can get an array representation of the current braille character based on index" do
      translator = BrailleTranslator.new
      expect(translator.get_braille_char_array([[".."], [".."], [".."]], 0)).to eq(["..", "..", ".."])
    end
  end
end
