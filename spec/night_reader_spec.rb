require 'rspec'
require './lib/night_reader'

RSpec.describe NightReader do
  describe '#initialize' do
    it "exists" do
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader).to be_an_instance_of(NightReader)
    end
  end
  describe '#print_confirmation' do
    it "can print a confirmation message" do
      allow(File).to receive(:readlines).and_return(["0.0.0.0.0.\n00.00.0..0\n....0.0.0."])
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect {night_reader.print_confirmation}.to output("Created 'original_message.txt' containing 5 characters\n").to_stdout
    end
  end
  describe '#get_file_braille_array' do
    # WIP
    it "can read a braille file into an array" do
      allow(File).to receive(:readlines).and_return(["0.0.0.0.0.\n", "00.00.0..0\n", "....0.0.0."])
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader.get_file_braille_array).to eq([["0.", "0.", "0.", "0.", "0."],
                                                         ["00", ".0", "0.", "0.", ".0"],
                                                         ["..", "..", "0.", "0.", "0."]])
    end
    it "can read a braille file with more than one braille line into an array" do
      allow(File).to receive(:readlines).and_return(["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n",
                                                     "................................................................................\n",
                                                     "................................................................................\n",
                                                     "0.\n",
                                                     "..\n",
                                                     ".."])
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader.get_file_braille_array).to eq([
        ["0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0.","0."],
        ["..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..",".."],
        ["..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..","..",".."]])
    end
  end
  describe '#combine_braille_array' do
    it "can combine a braille array of more than 1 braille line" do
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader.combine_braille_array([[".."], [".."], [".."], ["00"], ["00"], ["00"]])).to eq([["..", "00"], ["..", "00"], ["..", "00"]])
    end
  end
  describe '#get_file_characters' do
    it "can return the number of braille characters in a file" do
      allow(File).to receive(:readlines).and_return(["0.0.0.0.0.\n00.00.0..0\n....0.0.0."])
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader.get_file_characters).to eq(5)
    end
  end
  describe '#write_to_file' do
    it "can write to a file" do
      allow(NightReader).to receive(:braille_to_text).and_return("hello")
      night_reader = NightReader.new("braille.txt", "original_message.txt")
      expect(night_reader.write_to_file).to eq(nil)
    end
  end
end
