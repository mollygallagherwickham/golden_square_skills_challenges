require 'diary'

RSpec.describe Diary do
    it "returns empty all entries array" do
        diary = Diary.new
        expect(diary.all_entries).to eq []
    end

    it "returns empty all tasks array" do
        diary = Diary.new
        expect(diary.all_tasks).to eq []
    end
end