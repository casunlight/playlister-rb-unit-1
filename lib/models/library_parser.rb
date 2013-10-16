class LibraryParser

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def call
    Dir.foreach(self.url) do |file|

      next if !file.include?(".mp3")

      file = file.gsub('[','- ')[0..-6] #remove ].mp3 from file name
      artist, song, genre = file.split(' - ')

      artist_to_insert = Artist.find(artist) || Artist.new.tap {|a| a.name = artist }
      song_to_insert = Song.new.tap {|s| s.name = song }
      genre_to_insert = Genre.find(genre) || Genre.new.tap {|g| g.name = genre }

      song_to_insert.genre = genre_to_insert 
      artist_to_insert.add_song(song_to_insert)
  
    end
  end

end