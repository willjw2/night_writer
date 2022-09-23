require 'lib/braille_translator'
require 'lib/night_writer'

if ARGV == nil || ARGV[0] != "message.txt" || ARGV.length != 2
  puts "Please enter message.txt as the input file and another output file"
end

text_file = ARGV[0]
braille_file = ARGV[1]

night_writer = NightWriter.new(text_file, braille_file)
require "pry"; binding.pry
