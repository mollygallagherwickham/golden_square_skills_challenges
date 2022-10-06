# DiaryEntry instances go in here
class Diary
    def initialize
        @entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry (this is done within the test)
      @entries << entry
    end
  
    def all
      # Returns a list of instances of DiaryEntry
      @entries
    end
  
    def count_words
      # uses the count words method from DiaryEntry
      @entries.sum(&:count_words)
    end
  
    def reading_time(wpm)
      return fail "WPM must be above 0" unless wpm.positive?
      # uses count words from above to find the reading time across whole diary
      return (count_words.to_f / wpm).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
      # this looks through each of the entries
      # this takes the multiple entries that can be read in the time
      # and sorts them in order from shortest to longest
      # then returns the maximum
      fail "WPM must be above 0" unless wpm.positive?
      return readable_entries(wpm, minutes).max_by(&:count_words)
    end

    private
    def readable_entries(wpm, minutes)
      @entries.filter do |entry|
        # this then selects the entries with a reading time of minutes that is
        # equal to or less than the minutes provided in the argument
        entry.reading_time(wpm) <= minutes
      end
    end
  end