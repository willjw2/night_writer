require 'rspec'
require './lib/night_writer'

RSpec.describe NightWriter do
  describe '#initialize' do
    it "exists" do
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect(night_writer).to be_an_instance_of(NightWriter)
    end
  end
  describe '#print_confirmation' do
    #WIP
    it "can print out a confirmation message" do
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect {night_writer.print_confirmation}.to output("Created 'braille.txt' containing 12 characters\n").to_stdout
    end
  end
  describe '#get_file_char_length' do
    it "can return the read file's character length" do
      allow(File).to receive(:readlines).and_return(["hello world\n"])
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect(night_writer.get_file_char_length).to eq(12)
    end
  end
end
