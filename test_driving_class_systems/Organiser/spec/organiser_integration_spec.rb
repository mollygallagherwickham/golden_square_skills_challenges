require 'diary'
require 'diary_entry'

RSpec.describe "Organiser Integration" do
    it "creates diary entry and adds to diary" do
        diary_entry = DiaryEntry.new("Had a great day coding")
        diary = Diary.new
        diary.add_diary_entry(diary_entry.content)
        expect(diary.all_entries).to eq ["Had a great day coding"]
    end

    it "creates multiple entries and adds to diary" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        expect(diary.all_entries).to eq ["Had a great day coding", "Walked the dogs", "Made loads of pasta"]
    end

    it "counts words of each diary entry" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        expect(diary.total_word_count).to eq 12
    end

    it "selects 1 entry to read based on time and reading speed" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        expect(diary.select_entries(1, 3)).to eq ["Walked the dogs"]
    end

    it "selects 2 entries to read based on time and reading speed" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        expect(diary.select_entries(1, 4)).to eq ["Walked the dogs", "Made loads of pasta"]
    end

    it "fails when wpm is not above 0" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        expect{ diary.select_entries(1, 0) }.to raise_error "WPM must be above 0"
    end


    it "adds task to todolist in diary" do
        task1 = Task.new("Wash the dishes")
        diary = Diary.new
        diary.add_task(task1.task)
        expect(diary.all_tasks).to eq ["Wash the dishes"]
    end

    it "adds multiple tasks to todolist in diary" do
        task1 = Task.new("Wash the dishes")
        task2 = Task.new("Book dentist appointment")
        task3 = Task.new("Tidying my office")
        diary = Diary.new
        diary.add_task(task1.task)
        diary.add_task(task2.task)
        diary.add_task(task3.task)
        expect(diary.all_tasks).to eq ["Wash the dishes", "Book dentist appointment", "Tidying my office"]
    end

    it "marks the washing the dishes task as done and removes from todolist" do
        task1 = Task.new("Wash the dishes")
        task2 = Task.new("Book dentist appointment")
        task3 = Task.new("Tidying my office")
        diary = Diary.new
        diary.add_task(task1.mark_task_done)
        diary.add_task(task2.task)
        diary.add_task(task3.task)
        expect(diary.all_tasks).to eq ["Book dentist appointment", "Tidying my office"]
    end

    it "marks the washing the dishes and tidying office tasks as done and removes from todolist" do
        task1 = Task.new("Wash the dishes")
        task2 = Task.new("Book dentist appointment")
        task3 = Task.new("Tidying my office")
        diary = Diary.new
        diary.add_task(task1.mark_task_done)
        diary.add_task(task2.task)
        diary.add_task(task3.mark_task_done)
        expect(diary.all_tasks).to eq ["Book dentist appointment"]
    end

    it "extracts phone numbers from diary entries" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Called Schay on 01234567890")
        diary_entry3 = DiaryEntry.new("Made loads of pasta, got ingredients from 98765432109")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        contacts = Contacts.new
        contacts.extract_numbers(diary.all_entries)
        expect(contacts.list_numbers).to eq [["01234567890", "98765432109"]]
    end

    it "extracts phone numbers only and not just random numbers in diary entries" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Called Schay on 01234567890")
        diary_entry3 = DiaryEntry.new("Made loads of pasta, got ingredients from 9876543")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        contacts = Contacts.new
        contacts.extract_numbers(diary.all_entries)
        expect(contacts.list_numbers).to eq [["01234567890"]]
    end

    it "fails when no phone numbers are found in the entries" do
        diary_entry1 = DiaryEntry.new("Had a great day coding")
        diary_entry2 = DiaryEntry.new("Walked the dogs")
        diary_entry3 = DiaryEntry.new("Made loads of pasta")
        diary = Diary.new
        diary.add_diary_entry(diary_entry1.content)
        diary.add_diary_entry(diary_entry2.content)
        diary.add_diary_entry(diary_entry3.content)
        contacts = Contacts.new
        expect { contacts.extract_numbers(diary.all_entries) }.to raise_error "No phone numbers were found in entries"
    end
end