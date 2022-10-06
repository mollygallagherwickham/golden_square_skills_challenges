require 'diary_entry'

RSpec.describe DiaryEntry do
    it "constructs" do
        diary_entry = DiaryEntry.new("my title", "my contents")
        expect(diary_entry.title).to eq "my title"
        expect(diary_entry.contents).to eq "my contents"
    end

    describe "count_words" do
        it "counts the number of words in the contents" do
        diary_entry = DiaryEntry.new("my title", "my contents one two three")
        expect(diary_entry.count_words).to eq 5
        end

        it "returns 0 when contents is empty" do
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.count_words).to eq 0
        end
    end

    describe "reading time" do
        it "fails when wpm is 0 or a negative number" do
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect{ diary_entry.reading_time(0) }.to raise_error "WPM must be above 0"
        end

        it "returns 0 reading time when contents is empty" do
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.reading_time(2)).to eq 0
        end
        
        it "reads content in 1 minute given 1 word" do
            diary_entry = DiaryEntry.new("my title", "one")
            expect(diary_entry.reading_time(2)).to eq 1
        end
        
        it "returns a reading time for the contents" do
            diary_entry = DiaryEntry.new("my title", "my contents one two three")
            expect(diary_entry.reading_time(2)).to eq 3
        end
    end

end
