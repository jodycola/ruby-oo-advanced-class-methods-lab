require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    @@all.find { |x| x.name == name}
  end

  def Song.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end

  def Song.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def Song.new_from_filename(filename)
    filenames = filename.split(" - ")
    artist_name = filenames[0]
    name = filenames[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    filenames = filename.split(" - ")
    artist_name = filenames[0]
    name = filenames[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def Song.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end

#binding.pry