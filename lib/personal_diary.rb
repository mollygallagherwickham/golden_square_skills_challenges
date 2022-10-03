# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' 
# if there are more than that.

def make_snippet(string)
    words = string.split(" ")
    regex = /[!.,:;?@$%&)]/
    # if string is more than 5 words
    # if last character of fifth word is punctuation, delete last character
    if words.length >= 5 && words[4] =~ regex
        last_word = words[4].gsub(regex, "...")
        return words.first(4).join(" ") + " " +last_word
    elsif words.length >=5
        return words.first(5).join(" ") + "..."
    # if string is fewer than 5 words
    else   
        return string
    end
end


def count_words(string)
    # if string == ""
    #     return 0
    # else
    #     return string.split(" ").length
    # end
    string == "" ? 0 : string.split(" ").length
end

def reading_time(text)
    # count_words(text) -> will give us total number of words
    words_number = count_words(text)
    if words_number < 200
        return "Estimated reading time is less than 1 minute"
    elsif words_number == 200
        return "Estimated reading time is 1 minute"
    elsif (words_number / 200) < 60
        minutes = words_number / 200 
        return "Estimated reading time is #{minutes.ceil} minutes"
    else 
        minutes = words_number / 200
        hours = minutes / 60
        return "Estimated reading time is at least #{hours.ceil} hour"
    end
    # then work out estimated time (% - use to work out estimated)
end