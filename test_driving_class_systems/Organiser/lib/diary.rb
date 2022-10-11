class Diary
    def initialize
        @entries = []
        @tasks = []
    end

    def all_tasks
        # returns all incomplete tasks as an array
        return @tasks - complete_tasks
    end

    def complete_tasks
        @tasks.select do |task|
            task.start_with? "√"
        end
    end

    def add_task(task)
        # task is an instance of Task as a string and adds to all_tasks 
        return @tasks << task
    end

    def all_entries
        # returns all diary entries as an array
        return @entries
    end

    def add_diary_entry(entry)
        # entry is an instance of diary entry as a string and adds it to all_entries
        @entries << entry
    end

    def count_words
        # uses the count words method from DiaryEntry
        # returns array of integers
       return @entries.map do |entry|
        entry.count(" ") + 1
       end
    end

    def total_word_count
        return count_words.sum
    end

    def select_entries(minutes, wpm)
        # select diary entries to read based on time in minutes (integer) and reading speed (integer) 
        # return array of string(s)
        fail "WPM must be above 0" if wpm <= 0
        words_can_read = minutes * wpm
        # @entries.count_words
        #  return only if count_words =< words_can_read
        @entries.select do |entry|
            (entry.count(" ") + 1) <= words_can_read
        end
    end

end