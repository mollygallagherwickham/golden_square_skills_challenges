# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' 
# if there are more than that.

require 'personal_diary'

RSpec.describe "make_snippet method" do
    it "returns first 5 words followed by '...' " do
        result = make_snippet("Once upon a time a long time ago")
        expect(result).to eq("Once upon a time a...")

    end

    it "returns first 5 words followed by '...' while ignoring end of fifth word punctuation " do
        result = make_snippet("now, it was too purr-fect! Pee in the shoe")
        expect(result).to eq("now, it was too purr-fect...")
    end


    it "returns whole string if fewer than 5 words" do
        result = make_snippet("Lived happily ever after")
        expect(result).to eq("Lived happily ever after")
    end

    it "returns first 5 words including punctuation" do
        result = make_snippet("It's 3am, time to create some chaos present belly, scratch hand when stroked litter box is life,")
        expect(result).to eq("It's 3am, time to create...")
    end

end

# A method called count_words that takes a string as an argument and returns the number of words in that string.
RSpec.describe "count_words method" do
    it "returns 0 if the string is empty" do
        result = count_words("")
        expect(result).to eq 0
    end

    it "given a string of 3 words it returns 3" do
        result = count_words("time to create")
        expect(result).to eq 3
    end
end