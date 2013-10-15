
class CommandLine

APPROVED_COMMANDS ||= [:list, :exit, :play, :help, :song, :artist, :genre]

attr_reader :on

  def initialize
    @on=true
  end


  def call
    puts "Hey there. Welcome to Playlister!"
    puts "Please type one of the following: list, play, help, or exit."
    command_request
    while @on == true
      self.help
    end
  end

  def help
    puts "Please type one of the following: list, play, help, or exit."
    self.command_request
  end

  def command_request
    self.command(gets.strip.downcase)
  end
 
  def command(input)
    if APPROVED_COMMANDS.include?(input.strip.downcase.to_sym)
      self.send(input)
    else
      puts "invalid command"
    end
  end
 
  def exit
    puts "Goodbye!"
    @on=false
  end
 
  def list
    puts "How would you like the tracks displayed?"
    puts "Type 'Song' for all songs, 'Artist' for all artists, or 'Genre' for all genres."
    command_request
  end

  def song
    Song.all.each do |song|
      puts song.name
      #implement tabbing in future
    end
  end

  def artist
    Artist.all.each do |artist|
      puts artist.name
      #implement tabbing in future
    end
  end

  def genre
    Genre.all.each do |genre|
      puts genre.name.upcase
      genre.artists.each do |artist_obj|
        puts "   " + artist_obj.name
      end
      puts "\n\n"
      #implement tabbing in future
    end
  end

  def play
    puts "Which song would you like to play?"
    song_input = gets.strip.downcase
    song = Song.all.select do |s|
      s.name.downcase == song_input
    end.first
    if !song.nil?
      puts "Now Playing..."
      puts "#{song.artist.name}: #{song.name} - #{song.genre.name}"
    else
      puts "Sorry, we don't have that song at this time."
    end
  end



end

