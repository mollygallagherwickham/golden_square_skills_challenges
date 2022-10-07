require 'todo'
require 'todo_list'

RSpec.describe "todo list Integration" do
    context "adds tasks to list" do
        # need to create fail condition when adding empty task
        it "returns list when 1 task added" do
            todo = ToDo.new("Walk the dog")
            todo_list = ToDoList.new
            todo_list.add(todo.task)
            expect(todo_list.all).to eq ["Walk the dog"]
        end

        it "returns list when multiple tasks added" do
            todo_list = ToDoList.new
            todo = ToDo.new("Walk the dog")
            todo2 = ToDo.new("Wash the dishes")
            todo_list.add(todo.task)
            todo_list.add(todo2.task)
            expect(todo_list.all).to eq ["Walk the dog", "Wash the dishes"]
        end
    end

    context "checking done behaviour" do
        it "returns list of 1 completed task" do
            todo = ToDo.new("Walk the dog")
            todo_list = ToDoList.new
            todo_list.add(todo.mark_done!)
            expect(todo_list.complete).to eq ["COMPLETE: Walk the dog"]
        end

        it "returns list of 1 completed task when 3 tasks added" do
            todo1 = ToDo.new("Walk the dog")
            todo2 = ToDo.new("Wash the dishes")
            todo3 = ToDo.new("Make the dinner")
            todo_list = ToDoList.new
            todo_list.add(todo1.task)
            todo_list.add(todo2.task)
            todo_list.add(todo3.mark_done!)
            expect(todo_list.complete).to eq ["COMPLETE: Make the dinner"]
        end

        it "returns list of 1 incomplete task when 3 tasks added" do
            todo1 = ToDo.new("Walk the dog")
            todo2 = ToDo.new("Wash the dishes")
            todo3 = ToDo.new("Make the dinner")
            todo_list = ToDoList.new
            todo_list.add(todo1.task)
            todo_list.add(todo2.mark_done!)
            todo_list.add(todo3.mark_done!)
            expect(todo_list.incomplete).to eq ["Walk the dog"]
        end
    end
    
    context "time to give up behaviours" do
        it "gives up on all incomplete tasks" do
            todo_list = ToDoList.new
            todo1 = ToDo.new("Walk the dog")
            todo2 = ToDo.new("Wash the dishes")
            todo3 = ToDo.new("Make the dinner")
            todo_list.add(todo1.task)
            todo_list.add(todo2.task)
            todo_list.add(todo3.task)
            expect(todo_list.give_up!).to eq ["COMPLETE: Walk the dog", "COMPLETE: Wash the dishes", "COMPLETE: Make the dinner"]
        end

        it "gives up on all remaining incomplete tasks" do
            todo_list = ToDoList.new
            todo1 = ToDo.new("Walk the dog")
            todo2 = ToDo.new("Wash the dishes")
            todo3 = ToDo.new("Make the dinner")
            todo_list.add(todo1.mark_done!)
            todo_list.add(todo2.task)
            todo_list.add(todo3.task)
            expect(todo_list.give_up!).to eq ["COMPLETE: Walk the dog", "COMPLETE: Wash the dishes", "COMPLETE: Make the dinner"]
        end
    end
end