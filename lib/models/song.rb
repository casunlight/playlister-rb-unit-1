class Song
 
  attr_accessor :genre, :name, :artist

  @@all = []

  def initialize
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.find(song)
    Song.all.select { |s| s.name == song  }.first
  end


  # def artis t=(artist)
  #   @artist = artist
  #   artist.add_song(self)
  # end
end