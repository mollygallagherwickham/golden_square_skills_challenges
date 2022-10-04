# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' 
# if there are more than that.

require 'personal_diary'

RSpec.describe PersonalDiary do
    it "returns first 5 words followed by '...' " do
        entry = PersonalDiary.new
        result = entry.make_snippet("Once upon a time a long time ago")
        expect(result).to eq("Once upon a time a...")

    end

    it "returns first 5 words followed by '...' while ignoring end of fifth word punctuation " do
        entry = PersonalDiary.new
        result = entry.make_snippet("now, it was too purr-fect! Pee in the shoe")
        expect(result).to eq("now, it was too purr-fect...")
    end


    it "returns whole string if fewer than 5 words" do
        entry = PersonalDiary.new
        result = entry.make_snippet("Lived happily ever after")
        expect(result).to eq("Lived happily ever after")
    end

    it "returns first 5 words including punctuation" do
        entry = PersonalDiary.new
        result = entry.make_snippet("It's 3am, time to create some chaos present belly, scratch hand when stroked litter box is life,")
        expect(result).to eq("It's 3am, time to create...")
    end

# A method called count_words that takes a string as an argument and returns the number of words in that string.

    it "returns 0 if the string is empty" do
        entry = PersonalDiary.new
        result = entry.count_words("")
        expect(result).to eq 0
    end

    it "given a string of 3 words it returns 3" do
        entry = PersonalDiary.new
        result = entry.count_words("time to create")
        expect(result).to eq 3
    end

    it "given a text of 10 words, read in less than 3 seconds" do
        entry = PersonalDiary.new
        text = "Cat ipsum dolor sit amet Cat ipsum dolor sit amet"
        result = entry.reading_time(text)
        expect(result).to eq "Estimated reading time is 3 second(s)"
    end

    it "given a text of 20 words, read in estimated 6 seconds" do
        entry = PersonalDiary.new
        text = "Cat ipsum dolor sit amet Cat ipsum dolor sit amet Cat ipsum dolor sit amet Cat ipsum dolor sit amet"
        result = entry.reading_time(text)
        expect(result).to eq "Estimated reading time is 6 second(s)"
    end

    it "given a text of 200 words, read in 1 minute" do
        entry = PersonalDiary.new
        text = "Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on your pillow. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on."
        result = entry.reading_time(text)
        expect(result).to eq "Estimated reading time is 1 minute(s) and 0 second(s)"
    end

    it "given a text of 400 words, read in 2 minutes" do
        entry = PersonalDiary.new
        text = "Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on your pillow. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on your pillow. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on."
        result = entry.reading_time(text)
        expect(result).to eq "Estimated reading time is 2 minute(s) and 0 second(s)"
    end

    it "given a text of 12000 words, read in 1 hour" do
        entry = PersonalDiary.new
        text = "Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on your pillow. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on your pillow. Plays league of legends stare out the window. Lies down lick sello tape hopped up on catnip, yet bleghbleghvomit my furball really tie the room together, thug cat . Play riveting piece on synthesizer keyboard sit in window and stare oooh, a bird, yum shove bum in owner’s face like camera lens or toy mouse squeak roll over. Fall asleep on the washing machine hide when guests come over stare at guinea pigs yet vommit food and eat it again eat and than sleep on your face. Jump five feet high and sideways when a shadow moves throwup on. "
        new_text = text * 30
        result = entry.reading_time(new_text)
        expect(result).to eq "Estimated reading time is 1 hour(s), 0 minute(s) and 0 second(s)"
    end
    
    it "given text with TODO, return task" do
        entry = PersonalDiary.new
        text = "#TODO walk the dogs"
        result = entry.check_to_do(text)
        expect(result).to eq "Your tasks: walk the dogs"
    end

    it "given text with multiple TODO, return tasks" do
        entry = PersonalDiary.new
        text = "#TODO walk the dogs, #TODO wash the dishes"
        result = entry.check_to_do(text)
        expect(result).to eq "Your tasks: walk the dogs, wash the dishes"
    end

    it "given no TODO, return no tasks" do
        entry = PersonalDiary.new
        text = "Lorem ipsum dolor sit amet"
        result = entry.check_to_do(text)
        expect(result).to eq "There are no tasks given."
    end

    it "fails when text is nil" do
        entry = PersonalDiary.new
        text = nil
        expect{entry.check_to_do(text)}.to raise_error "No text given."
    end


end