### INTEGRATION TEST EXAMPLE ###

# Gets all tracks
# this will create a new library, create 2 tracks and add those tracks to the library. Then, it will return all of the tracks
should return as an array
```
library = MusicLibrary.new
track_1 = Track.new("Yellow Submarine", "The Beatles")
track_2 = Track.new("Toxic", "Britney Spears")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

# Looks through all tracks that have been added and finds track that includes the keyword 
should return as a string
```
library = MusicLibrary.new
track_1 = Track.new("Yellow Submarine", "The Beatles")
track_2 = Track.new("Toxic", "Britney Spears")
library.add(track_1)
library.add(track_2)
library.search_by_title("YELLOW") # => "YELLOW SUBMARINE by THE BEATLES" 
```

### UNIT TEST EXAMPLE ###
## Track ##

# Creates new track, returns title
``` 
track_1 = Track.new("Yellow Submarine", "The Beatles")
track_1.title # => "Yellow Submarine"
```
# Creates new track, returns artist
```
track_1 = Track.new("Toxic", "Britney Spears")
track_1.artist # => "Britney Spears"
```
# Creates new track and formats
```
track_1 = Track.new("Purple Rain", "Prince")
track_1.format # => "PURPLE RAIN by PRINCE"
```

## MusicLibrary ##

# creates new empty library
``` 
library = MusicLibrary.new
library.all # => []
```

