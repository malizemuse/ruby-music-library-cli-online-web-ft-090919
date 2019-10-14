class Artist

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect { |song| song.genre }
    genres.uniq
  end

  def artists
    artists = @songs.collect { |artist| song.artist }
  end

end
