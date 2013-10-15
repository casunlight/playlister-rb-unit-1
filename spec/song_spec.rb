require_relative './spec_helper.rb'

describe "Song" do

  let (:song) {Song.new }
  it "can initialize a song" do
    song.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song.name = "My song"
    song.name.should eq("My song")
  end

  it "can have a genre" do
    rap = Genre.new
    rap.name = "rap"
    song.genre = rap
    song.genre.should be_an_instance_of(Genre)
  end

  it "has an artist" do
    s = Song.new
    s.name = "Runaway"
    kanye = Artist.new
    kanye.name = "Kanye"
    r = Genre.new
    r.name = "Rap"
    s.genre = r
    kanye.add_song(s)
    s.artist.should eq(kanye)
  end
end