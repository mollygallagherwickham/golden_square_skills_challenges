require 'todo_list'

RSpec.describe ToDoList do
    context "intiially" do
        it "constructs has an empty list" do
            todo_list = ToDoList.new
            expect(todo_list.all).to eq []
        end
    end
end

