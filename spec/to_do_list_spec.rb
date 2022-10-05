require 'to_do_list.rb'

RSpec.describe ToDoList do
    it "adds and returns tasks" do
        task = ToDoList.new 
        task.add("walk the dog")
        expect(task.list).to eq ["walk the dog"]
    end

    it "adds and returns multiple tasks" do
        task = ToDoList.new 
        task.add("walk the dog")
        task.add("wash the dishes")
        task.add("make dinner")
        expect(task.list).to eq ["walk the dog", "wash the dishes", "make dinner"]
    end

    it "adds and returns multiple tasks" do
        task = ToDoList.new 
        task.add("walk the dog")
        task.add("wash the dishes")
        task.add("make dinner")
        task.complete("walk the dog")
        expect(task.list).to eq ["wash the dishes", "make dinner"]
    end

end

# task = ToDoList.new 
# task.add("walk the dog") 
# task.list => "walk the dog"

# task = ToDoList.new 
# task.add("walk the dog") 
# task.complete("walk the dog")
# task.list => []