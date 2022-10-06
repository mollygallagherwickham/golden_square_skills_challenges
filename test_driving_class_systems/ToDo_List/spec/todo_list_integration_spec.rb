require 'todo'
require 'todo_list'

RSpec.describe "todo list Integration" do
    it "returns list of 1 task added" do
        todo = ToDo.new("Walk the dog")
        todo_list = ToDoList.new
        todo_list.add(todo.task)
        expect(todo_list.all).to eq ["Walk the dog"]
    end

    it "returns list of multiple tasks added" do
        todo_list = ToDoList.new
        todo = ToDo.new("Walk the dog")
        todo_list.add(todo.task)
        todo2 = ToDo.new("Wash the dishes")
        todo_list.add(todo2.task)
        expect(todo_list.all).to eq ["Walk the dog", "Wash the dishes"]
    end

    it "marks task as complete" do
        todo_list = ToDoList.new
        todo = ToDo.new("Walk the dog")
        todo_list.add(todo.task.mark_done!)
        expect(todo_list.complete).to eq ["COMPLETE: Walk the dog", "Wash the dishes"]
    end
end