# require_relative 'lib/night_writer'
require './lib/night_reader'

if ARGV == nil || ARGV[0] != "braille.txt" || ARGV.length != 2
  puts "Please enter braille.txt as the input file and another output file as command line inputs"
  exit
end

braille_file = ARGV[0]
text_file = ARGV[1]

night_reader = NightReader.new(braille_file, text_file)
night_reader.print_confirmation

require "pry"; binding.pry
