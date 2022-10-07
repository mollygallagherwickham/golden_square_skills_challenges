 class Track
    def initialize(title, artist) # both are strings
        @title = title
        @artist = artist
    end

    def title
        # returns title of track
        fail "TITLE IS MISSING" if @title.empty?
        return @title
    end

    def artist
        # returns artist of the track
        fail "ARTIST IS MISSING" if @artist.empty?
        return @artist
    end

    def format
        # returns the track as TITLE by ARTIST
        "#{@title.upcase} by #{@artist.upcase}"
        # track = [@title, @artist].map(&:upcase)
        # track[0] + " by " + track[1]
    end

 end

# track_1 = Track.new("Yellow Submarine", "The Beatles")
# p track_1.format