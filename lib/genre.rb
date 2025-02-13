require 'pry'
require_relative '../lib/concerns/findable.rb' 

class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    
    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
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

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        self.songs.collect{|song| song.artist}.uniq
    end

end