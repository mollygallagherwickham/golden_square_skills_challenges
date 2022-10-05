require 'diary_entry'

RSpec.describe DiaryEntry do
    it "creates a new object" do
        diary_entry = DiaryEntry.new("Green Eggs and Ham", "I do not like them Sam-I-Am")
        expect(diary_entry.title).to eq "Green Eggs and Ham"
    end

    it "creates a new object" do
        diary_entry = DiaryEntry.new("Green Eggs and Ham", "I do not like them Sam-I-Am")
        expect(diary_entry.contents).to eq "I do not like them Sam-I-Am"
    end

    it "counts words of contents and returns a value of 5" do
        diary_entry = DiaryEntry.new("Dear Diary","This is a new page!")
        expect(diary_entry.count_words).to eq 5
    end

    context "when contents not given" do
        it "returns an error" do
            diary_entry = DiaryEntry.new("Dear Diary","")
            expect{diary_entry.count_words}.to raise_error "Content not valid!"
        end
    end

    it "returns 1 minute when reading per minute is 100" do
        diary_entry = DiaryEntry.new("Dear Diary","one " * 100)
        expect(diary_entry.reading_time(100)).to eq "1 minute(s)" 
    end

    it "returns 4 minutes when reading per minute is 100" do
        diary_entry = DiaryEntry.new("Dear Diary","one " * 336)
        expect(diary_entry.reading_time(100)).to eq "4 minute(s)" 
    end

    it "returns error if wpm is 0" do
        diary_entry = DiaryEntry.new("Dear Diary", 0)
        expect{diary_entry.reading_time(0)}.to raise_error "Reading speed must be above zero." 
    end

    it "returns 5 words from contents based on 5 wpm" do
        diary_entry = DiaryEntry.new("Dear Diary","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod")
        chunk = diary_entry.reading_chunk(5, 1)
        expect(chunk).to eq "Lorem ipsum dolor sit amet," 
    end

    it "returns remaining words from contents having read first 10 words in previous call" do
        diary_entry = DiaryEntry.new("Dear Diary","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod")
        diary_entry.reading_chunk(5, 1)
        chunk = diary_entry.reading_chunk(5, 1)
        expect(chunk).to eq "consectetur adipiscing elit. Etiam euismod" 
    end

    it "restarts after reading whole contents" do
        diary_entry = DiaryEntry.new("Dear Diary","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod")
        diary_entry.reading_chunk(5, 1)
        diary_entry.reading_chunk(5, 1)
        chunk = diary_entry.reading_chunk(5, 1)
        expect(chunk).to eq "Lorem ipsum dolor sit amet,"
    end

end