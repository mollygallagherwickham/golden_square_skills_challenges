require 'diary_entry'

RSpec.describe DiaryEntry do
    it "creates diary entry and returns content" do
        diary_entry = DiaryEntry.new("Had a great day coding")
        expect(diary_entry.content).to eq "Had a great day coding" 
    end

    it "counts words of diary entry content" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        expect(diary_entry1.count_words).to eq 5
    end

    it "fails when content is empty" do
        diary_entry1 = DiaryEntry.new("")
        expect { diary_entry1.content }.to raise_error "Content is empty"
    end
end