class MusicLibrary
    def initialize
        @list = [] # store tracks in array
    end

    def add(track) # track is a string 
        # adds track to the library
        # returns nothing
        @list << track.format
    end

    def all
        # returns all tracks that have added
        @list
    end

    def found_keyword(keyword)
        @list.find do |title, artist|
            title.include?(keyword)
        end
    end

    def search_by_title(keyword)
        # returns track(s) with keywords included
        fail "CANNOT FIND A TRACK WITH THAT KEYWORD" if found_keyword(keyword).nil?
        return found_keyword(keyword)
        # if false - return error
    end
end
