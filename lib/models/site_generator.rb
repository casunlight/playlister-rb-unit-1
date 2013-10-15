

# 100.times do
#   Dog.new.tap do |d|
#     d.name = Faker::Name.name 
#     d.color = Faker::Lorem.word
#     d.bio = Faker::Lorem.paragraph
#     d.save
#   end
# end

class SiteGenerator

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
    # For each dog, first, cast the dog into instance var

    Artist.all.each do |artist|

      File.open("_site/artists/#{self.normalize(artist.name)}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
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


