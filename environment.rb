require 'pry'
require_relative 'lib/models/artist.rb'
require_relative 'lib/models/genre.rb'
require_relative 'lib/models/song.rb'
require_relative 'lib/models/library_parser.rb'
require_relative 'lib/models/command_line.rb'

parser = LibraryParser.new("#{Dir.pwd}/db/data")

parser.call


cmd = CommandLine.new
cmd.call
