#track = TrackList.new
#track.add("Dancing Queen - ABBA")
#track.list => ["Dancing Queen - ABBA"]
require 'track_list'

RSpec.describe TrackList do
    it 'add a track to the list and return the list' do
        track = TrackList.new
        track.add("Dancing Queen - ABBA")
        expect(track.list).to eq ["Dancing Queen - ABBA"]
    end

#track = TrackList.new
#track.add("Dancing Queen - ABBA")
#track.add("Mamma Mia - ABBA")
#track.list => ["Dancing Queen - ABBA", "Mamma Mia - ABBA"]
    it 'add multiple tracks to the list and return the list' do
        track = TrackList.new
        track.add("Dancing Queen - ABBA")
        track.add("Mamma Mia - ABBA")
        expect(track.list).to eq ["Dancing Queen - ABBA", "Mamma Mia - ABBA"]
    end
end
