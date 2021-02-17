require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call

  user_input = " "
  while user_input != "exit"
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"

  user_input = gets.strip
    end
  end


  def list_songs

  Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end


  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
        puts "#{i}. #{a.name}"
    end
  end

  def list_genres

    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
          puts "#{i}. #{g.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
    artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
    genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
     puts "Which song number would you like to play?"
     song_num = gets.strip
     n = list_songs[song_num.to_i - 1]
     

# Split songs by "." and "-"

     puts "Playing #{n.song} by #{n.artist}"
   end

  #  def list_songs
   #
  #  Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
  #    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  #    end
  #  end

  #  expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")
   #
  #  music_library_controller.play_song
  #  end
   #
  #  it "does not 'puts' anything out if a matching song is not found" do
  #  allow(music_library_controller).to receive(:gets).and_return("6")
   #
  #  expect($stdout).to receive(:puts).with("Which song number would you like to play?")
  #  expect($stdout).to_not receive(:puts)
   #
  #  music_library_controller.play_song
  #  end
   #
  #  it "checks that the user entered a number between 1 and the total number of songs in the library" do
  #  allow(music_library_controller).to receive(:gets).and_return("0")
   #
  #  expect($stdout).to receive(:puts).with("Which song number would you like to play?")
  #  expect($stdout).to_not receive(:puts)
   #
  #  music_library_controller.play_song
  #  end
  #  end
  #  end




end
