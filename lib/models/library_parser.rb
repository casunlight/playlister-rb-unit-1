class LibraryParser

  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def call
    Dir.foreach(self.url) do |file|

      next if !file.include?(".mp3")

      file = file.gsub(' - ','|').gsub(' [','|').gsub(']','|')[0...-5]
      artist, song, genre = file.split('|')

      artist_to_insert = Artist.find(artist)
      artist_to_insert = artist_to_insert || Artist.new.tap {|a| a.name = artist }

      song_to_insert = Song.new.tap do |s|
        s.name = song
      end

      genre_to_insert = Genre.find(genre)
      genre_to_insert = genre_to_insert || Genre.new.tap {|g| g.name = genre }

      song_to_insert.genre = genre_to_insert 
      artist_to_insert.add_song(song_to_insert)
  
    end
  end

end