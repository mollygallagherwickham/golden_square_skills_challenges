class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
      # Returns the title as a string
      @title
    end
  
    def contents
      # Returns the contents as a string
      @contents
    end

    def words
      @contents.split(" ")
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      fail "Content not valid!" if @contents.empty?
      words.length
    end
  
    def reading_time(wpm) 
      # checks that wpm is above 0
      fail "Reading speed must be above zero." unless wpm.positive?
      time = count_words / wpm.to_f
      return "#{time.ceil} minute(s)"
    end

    def reading_chunk(wpm, minutes) 
      # calculates number of words can be read 
      no_words_can_read = wpm * minutes
      # calculates which word to start from
      start_from = @furthest_word_read
      # calculates which word to stop at
      end_at = @furthest_word_read + no_words_can_read
      # calculates if end_at number is larger than count words (therefore start again)
      if end_at >= count_words
        @furthest_word_read = 0
      # therefore, not finished, pick up from the end of last chunk
      else
        @furthest_word_read = end_at 
      end
      # returns an array of words from start_from to end_at
      word_list = words[start_from, end_at]
      return word_list.join(" ")
    end
  end