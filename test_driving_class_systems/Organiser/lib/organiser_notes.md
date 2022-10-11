As a user
So that I can record my experiences
I want to keep a regular diary
=> add
=> keep

As a user
So that I can reflect on my experiences
I want to read my past diary entries
=> read

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
=> read
=> select


As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
=> track
=> add


As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all 
my diary entries
=> extract
=> see


# INTEGRATION TESTS

# Creating diary entry and adding to diary
diary_entry = DiaryEntry.new("Had a great day coding")
diary = Diary.new
diary_entry.content
diary.add_diary_entry(diary_entry)
expect(diary.all_entries).to eq ["Had a great day coding"]

# Creates multiple entries and adds to diary
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Walked the dogs")
diary_entry3 = DiaryEntry.new("Made loads of pasta")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
expect(diary.all_entries).to eq ["Had a great day coding", "Walked the dogs", "Made loads of pasta"]

# fails when adding an empty diary entry
diary_entry = DiaryEntry.new("")
diary = Diary.new
diary_entry.content
diary.add_diary_entry(diary_entry)
expect{ diary.all_entries }.to raise_error "The diary entry added is empty"


# count words of each diary entry
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Walked the dogs")
diary_entry3 = DiaryEntry.new("Made loads of pasta")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
expect(diary.count_words).to eq 12

# selects diary entry to read based on time and reading speed
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Walked the dogs")
diary_entry3 = DiaryEntry.new("Made loads of pasta")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
expect(diary.select_entries(1, 3)).to eq ["Walked the dogs"]

# fails when wpm is 0
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Walked the dogs")
diary_entry3 = DiaryEntry.new("Made loads of pasta")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
expect{ diary.select_entries(1, 0) }.to raise_error "WPM must be above 0"

# adding tasks to todolist in diary
task1 = Task.new("Wash the dishes")
diary = Diary.new
diary.add_task(task1.task)
expect(diary.all_tasks).to eq ["Wash the dishes"]

# add multiple tasks to todolist in diary
task1 = Task.new("Wash the dishes")
task2 = Task.new("Book dentist appointment")
task3 = Task.new("Tidying my office")
diary = Diary.new
diary.add_task(task1.task)
diary.add_task(task2.task)
diary.add_task(task3.task)
expect(diary.all_tasks).to eq ["Wash the dishes", "Book dentist appointment", "Tidying my office"]


# mark the washing the dishes task as done and removes from todolist
task1 = Task.new("Wash the dishes")
task2 = Task.new("Book dentist appointment")
task3 = Task.new("Tidying my office")
diary = Diary.new
diary.add_task(task1.mark_task_done)
diary.add_task(task2.task)
diary.add_task(task3.task)
expect(diary.all_tasks).to eq ["Book dentist appointment", "Tidying my office"]

# extracting phone numbers from diary entries
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Called Schay on 01234567890")
diary_entry3 = DiaryEntry.new("Made loads of pasta, got ingredients from 98765432109")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
contacts = Contacts.new
expect(contacts.extract_numbers(diary.all_entries)).to eq ["01234567890", "98765432109"]

# extracts phone numbers from diary entries when other random numbers appear in entries
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Called Schay on 01234567890")
diary_entry3 = DiaryEntry.new("Made loads of pasta, got ingredients from 9876543")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
contacts = Contacts.new
expect(contacts.extract_numbers(diary.all_entries)).to eq [["01234567890"]]

# fails when no numbers are in the entries
diary_entry1 = DiaryEntry.new("Had a great day coding")
diary_entry2 = DiaryEntry.new("Walked the dogs")
diary_entry3 = DiaryEntry.new("Made loads of pasta")
diary = Diary.new
diary.add_diary_entry(diary_entry1.content)
diary.add_diary_entry(diary_entry2.content)
diary.add_diary_entry(diary_entry3.content)
expect { contacts.extract_numbers(diary.all_entries) }.to raise_error "No phone numbers were found in entries"





# UNIT TEST
# Creates diary entry and returns content
diary_entry = DiaryEntry.new("Had a great day coding")
expect(diary_entry.content).to eq "Had a great day coding" 

# returns empty all_entries array
diary = Diary.new
expect(diary.all_entries).to eq []

# counts words of diary entry content
diary_entry1 = DiaryEntry.new("Had a great day coding")
expect(diary_entry1.count_words).to eq 5

# fails if content is empty
diary_entry1 = DiaryEntry.new("")
expect { diary_entry1.content }.to raise_error "Content is empty"

# fails word count when content is empty


# returns empty all_tasks array
diary = Diary.new
expect(diary.all_tasks).to eq []

# creates one task
task1 = Task.new("Wash the dishes")
expect(task1.task).to eq "Wash the dishes"

# fails when task is empty
task1 = Task.new("")
expect { task1.task }.to raise_error "Task is empty"


# creates task and marks as done
task1 = Task.new("Wash the dishes")
expect(task1.mark_task_done).to eq "√ Wash the dishes"

# list an empty array of numbers
contact = Contacts.new
expect(contact.list_numbers).to eq []


# 1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.


# 2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail. (classes and methods with what they do and expect to return)


# 3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.


# 4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

Encode each example as a test. You can add to the above list as you go.


# 5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.