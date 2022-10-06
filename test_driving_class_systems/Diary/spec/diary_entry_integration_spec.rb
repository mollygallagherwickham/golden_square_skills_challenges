require 'diary'
require 'diary_entry'

RSpec.describe "diary entry Integration" do
    it "lists the entries added" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title", "contents")
        diary_entry_2 = DiaryEntry.new("my title 2", "contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

    describe "word counting behaviour" do
        it "counts the words in all diary entries contents" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.count_words).to eq 5
        end
    end

    describe "reading time behaviour" do
        it "fails when WPM is 0 or a negative number" do
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect{ diary_entry.reading_time(0) }.to raise_error "WPM must be above 0"
        end
        
        it "calculates the reading time for all entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end

        it "calculates the reading time for all entries where it falls over a minute" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end

    end

    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

    describe "best reading time behaviour" do
        context "where we have just 1 entry and it is readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title", "my contents")
                diary.add(diary_entry_1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq diary_entry_1
            end
        end

        context "where we have just 1 entry and it is readable in the time" do
            it "returns nil" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title", "my contents extra")
                diary.add(diary_entry_1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
            end
        end
        context "where we have just multiple entries and it finds the first readable in the time" do
            it "returns the longest entry that can be read in the time" do
                diary = Diary.new
                best_entry = DiaryEntry.new("my title", "one two")
                diary.add(DiaryEntry.new("my title", "one"))
                diary.add(best_entry)
                diary.add(DiaryEntry.new("my title", "one two three"))
                diary.add(DiaryEntry.new("my title", "one two three four"))
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq best_entry
            end
        end

        context "where we have 1 entry but wpm given is 0" do
            it "returns WPM error" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title", "my contents")
                diary.add(diary_entry_1)
                result = diary.find_best_entry_for_reading_time(0, 1)
                expect{ result }.to raise_error "WPM must be above 0"
            end
        end
    end
    
end
