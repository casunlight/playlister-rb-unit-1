class Artist

  attr_accessor :name, :songs, :genres

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    self.songs << song
    self.genres << song.genre
    song.artist = self
    if !song.genre.artists.include?(self)
      song.genre.artists << self
    end
  end

  def self.reset_artists
    @@artists.clear
  end

  def self.all
    @@artists
  end

  def self.count
    all.count
  end

  def song_count
    self.songs.size
  end

  def self.find(artist)
    self.all.select { |a| a.name == artist }.first
  end

end