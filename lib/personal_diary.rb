# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' 
# if there are more than that.
class PersonalDiary 
    
    def make_snippet(string)
        words = string.split(" ")
        regex = /[!.,:;?@$%&)]/
        # if string is more than 5 words
        # if last character of fifth word is punctuation, delete last character
        if count_words(string) >= 5 && words[4] =~ regex
            last_word = words[4].gsub(regex, "...")
            return words.first(4).join(" ") + " " +last_word
        elsif count_words(string) >=5
            return words.first(5).join(" ") + "..."
        # if string is fewer than 5 words
        else   
            return string
        end
    end

    def count_words(string)
        string.split(" ").length
    end

    def reading_time(text)
        number = count_words(text)
        hours = (number / 12000)
        minutes = (number / 200)
        seconds = ((number % 200) / 3).round(2)
        if number < 200
            return "Estimated reading time is #{seconds} second(s)"
        elsif number < 12000
            return "Estimated reading time is #{minutes} minute(s) and #{seconds} second(s)"
        elsif number % 12000 == 0
            return "Estimated reading time is #{hours} hour(s), 0 minute(s) and 0 second(s)"
        else 
            return "Estimated reading time is #{hours} hour(s), #{minutes} minute(s) and #{seconds} second(s)"
        end
    end

#     As a user
#     So that I can keep track of my tasks
#     I want to check if a text includes the string #TODO.

# check_to_do(text)
# text: a string (e.g. #TODO walk the dogs)

# check_to_do("#TODO walk the dogs") => "Your tasks: walk the dogs"
# check_to_do("#TODO walk the dogs, #TODO wash the dishes") => "Your tasks: walk the dogs, wash the dishes"
# check_to_do("Lorem ipsum dolor sit amet") => "There are no tasks given."
# check_to_do(""") => "There are no tasks given."
# check_to_do(nil) => throws an error
    def check_to_do(text)
        if text.nil?
            fail "No text given."
        elsif text.include?("#TODO")
            task = text.delete("#TODO").split(",").map{|x| x.strip}.join(", ")
            "Your tasks: #{task}"
        else
            "There are no tasks given."
        end
    end
end