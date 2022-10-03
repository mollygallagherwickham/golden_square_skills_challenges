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