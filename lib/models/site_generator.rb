class SiteGenerator

  def self.call
    self.generate_artist_index
    self.generate_genre_index
    self.generate_artist
    self.generate_genre
    self.generate_song
  end

  def self.generate_artist_index
    index = ERB.new(File.open('lib/views/artist_index.erb').read)
    artists = Artist.all

    File.open('_site/artists.html', 'w+') do |f|
      f << index.result(binding)
    end
  end

  def self.generate_genre_index
    index = ERB.new(File.open('lib/views/genre_index.erb').read)
    genres = Genre.all

    File.open('_site/genres.html', 'w+') do |f|
      f << index.result(binding)
    end
  end

  def self.normalize(param)
    param.gsub(' ','_').downcase
  end

  def self.generate_artist
    file_name= "lib/views/artist.erb"
    show = ERB.new(File.open(file_name).read)

    Artist.all.each do |artist|

      File.open("_site/artists/#{self.normalize(artist.name)}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def self.generate_genre
    file_name= "lib/views/genre.erb"
    show = ERB.new(File.open(file_name).read)

    Genre.all.each do |genre|

      File.open("_site/genres/#{self.normalize(genre.name)}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def self.generate_song
    show = ERB.new(File.open('lib/views/song.erb').read)
   
    Song.all.each do |song|

      File.open("_site/songs/#{self.normalize(song.name)}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def self.make_youtube_link(song_string)
    yt = YoutubeSearch.search(song_string).first["video_id"]
    link = "http://www.youtube.com/embed/#{yt}"

    "<iframe src='" + link + "'width=640 height=480 frameborder=0></iframe>"
  end

  #   def generate_song
  #   file_name= "lib/views/song.erb"
  #   show = ERB.new(File.open(file_name).read)
  #   # For each dog, first, cast the dog into instance var

  #   Song.all.each do |song|
  #     File.open("_site/songs/#{dog.url}.html", 'w+') do |f|
  #       f << show.result(binding)
  #     end
  #   end
  # end


  #   def generate_genre
  #   file_name= "lib/views/genre.erb"
  #   show = ERB.new(File.open(file_name).read)
  #   # For each dog, first, cast the dog into instance var

  #   Genre.all.each do |dog|
  #     File.open("_site/genres/#{dog.url}.html", 'w+') do |f|
  #       f << show.result(binding)
  #     end
  #   end
  # end

end


