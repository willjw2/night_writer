require 'rspec'
require './lib/night_writer'

RSpec.describe NightWriter do
  describe '#initialize' do
    it "exists" do
      night_writer = NightWriter.new
      expect(night_writer).to be_an_instance_of(NightWriter)
    end
  end
  describe '#print_confirmation' do
    it "can print out a confirmation message" do
      night_writer = NightWriter.new
      allow(NightWriter).to receive(:ARGV).and_return(["message.txt", "braille.txt"])
      expect(night_writer.print_confirmation).to eq("Created 'braille.txt' containing 0 characters")
    end
  end
end
