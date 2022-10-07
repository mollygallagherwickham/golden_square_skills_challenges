require 'track'

RSpec.describe Track do
    it "constructs track and returns title" do
        track_1 = Track.new("Yellow Submarine", "The Beatles")
        expect(track_1.title).to eq "Yellow Submarine"
    end

    it "constructs track and returns artist" do
        track_1 = Track.new("Toxic", "Britney Spears")
        expect(track_1.artist).to eq "Britney Spears"
    end

    it "formats the track as title by artist" do
        track_1 = Track.new("Purple Rain", "Prince")
        expect(track_1.format).to eq "PURPLE RAIN by PRINCE"
    end

    it "fails when title is empty" do
        track_1 = Track.new("", "Prince")
        expect{ track_1.title }.to raise_error "TITLE IS MISSING"
    end

    it "fails when artist is empty" do
        track_1 = Track.new("Purple Rain", "")
        expect{ track_1.artist }.to raise_error "ARTIST IS MISSING"
    end
end
