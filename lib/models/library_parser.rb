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

      artist_insert = Artist.all.select { |a| a.name == artist }.first

      if artist_insert.nil?
        artist_insert = Artist.new.tap do |a|
          a.name = artist
        end  
      end

      song_insert = Song.new.tap do |s|
        s.name = song
      end

      genre_insert = Genre.all.select { |g| g.name == genre }.first

      if genre_insert.nil?
        genre_insert = Genre.new.tap do |g|
          g.name = genre
        end  
      end

      song_insert.genre = genre_insert 
      artist_insert.add_song(song_insert)
  
    end
  end

end