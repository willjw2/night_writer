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
      expect {night_writer.print_confirmation}.to output("Created 'original_message.txt' containing 5 characters\n").to_stdout
    end
  end
end
