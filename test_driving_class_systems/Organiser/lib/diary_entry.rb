class DiaryEntry
    def initialize(content)
        @content = content
    end

    def content
        # return content as a string
        return fail "Content is empty" if @content.empty?
        return @content
    end

    def count_words
        # count number of words in content and returns an integer
        return fail "Content is empty" if @content.empty?
        return @content.count(" ") + 1
    end
end