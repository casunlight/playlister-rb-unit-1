require_relative 'lib/models/artist.rb'
require_relative 'lib/models/genre.rb'
require_relative 'lib/models/song.rb'
require_relative 'lib/models/library_parser.rb'

parser = LibraryParser.new('/Users/scott1/Development/flatiron_homework/playlister-rb-unit-1/db/data')

parser.call