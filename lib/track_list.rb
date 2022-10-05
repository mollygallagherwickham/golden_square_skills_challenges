# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.

class TrackList 
    def initialize
        @tracks = []
    end

    def add(track)
        @tracks << track
    end

    def list
        @tracks
    end
end
