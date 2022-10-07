require 'track'
require 'musiclibrary'

RSpec.describe "music player integration" do
    it "gets all tracks" do
        library = MusicLibrary.new
        track_1 = Track.new("Yellow Submarine", "The Beatles")
        track_2 = Track.new("Toxic", "Britney Spears")
        library.add(track_1)
        library.add(track_2)
        expect(library.all).to eq ["YELLOW SUBMARINE by THE BEATLES", "TOXIC by BRITNEY SPEARS"]
    end

    it "finds track in library that has keyword" do
        library = MusicLibrary.new
        track_1 = Track.new("Yellow Submarine", "The Beatles")
        track_2 = Track.new("Toxic", "Britney Spears")
        library.add(track_1)
        library.add(track_2)
        expect(library.search_by_title("YELLOW")).to eq "YELLOW SUBMARINE by THE BEATLES"
    end

    # what if the keyword isn't in the library
    it "fails if keyword not found in any tracks in the library" do
        library = MusicLibrary.new
        track_1 = Track.new("Yellow Submarine", "The Beatles")
        track_2 = Track.new("Toxic", "Britney Spears")
        library.add(track_1)
        library.add(track_2)
        expect{ library.search_by_title("GREEN") }.to raise_error "CANNOT FIND A TRACK WITH THAT KEYWORD"
    end
end