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
    it "can print out a confirmation message" do
      allow(File).to receive(:readlines).and_return(["hello world\n"])
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect {night_writer.print_confirmation}.to output("Created 'braille.txt' containing 11 characters\n").to_stdout
    end
  end
  describe '#get_file_text' do
    it "can return the read file's text" do
      allow(File).to receive(:readlines).and_return(["hello world\n"])
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect(night_writer.get_file_text).to eq("hello world")
    end
  end
  describe '#write_to_file' do
    #WIP
    it "can write a braille translation to a file" do
      allow(File).to receive(:readlines).and_return(["hello world\n"])
      night_writer = NightWriter.new("message.txt", "braille.txt")
      expect(night_writer.write_to_file).to eq(true)
    end
  end
end
