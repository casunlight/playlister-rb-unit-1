require 'pry'
require 'erb'
require 'youtube_search'
require_relative 'lib/models/artist.rb'
require_relative 'lib/models/genre.rb'
require_relative 'lib/models/song.rb'
require_relative 'lib/models/library_parser.rb'
require_relative 'lib/models/command_line.rb'
require_relative 'lib/models/site_generator.rb'

parser = LibraryParser.new("#{Dir.pwd}/db/data")
parser.call

SiteGenerator.call

# cmd = CommandLine.new
# cmd.call