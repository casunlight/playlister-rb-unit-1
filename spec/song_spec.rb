require_relative './spec_helper.rb'

describe "Song" do

  let (:artist) { Artist.new }
  let (:song) { Song.new }
  let (:rap) { Genre.new }

  it "can initialize a song" do
    song.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song.name = "My song"
    song.name.should eq("My song")
  end

  it "can have a genre" do
    rap.name = "rap"
    song.genre = rap
    song.genre.should be_an_instance_of(Genre)
  end

  it "has an artist" do
    song.genre = rap
    artist.add_song(song)
    song.artist.should eq(artist)
  end

  describe "Class Methods" do

    it "can find all matches for a song" do
      song.name = "My song"
      Song.find("My song").should include(song)
    end
  end
end