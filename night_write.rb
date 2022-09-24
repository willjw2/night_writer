# require_relative 'lib/night_writer'
require './lib/night_writer'

if ARGV == nil || ARGV[0] != "message.txt" || ARGV.length != 2
  puts "Please enter message.txt as the input file and another output file as command line inputs"
  exit
end

text_file = ARGV[0]
braille_file = ARGV[1]

night_writer = NightWriter.new(text_file, braille_file)
night_writer.print_confirmation

require "pry"; binding.pry
