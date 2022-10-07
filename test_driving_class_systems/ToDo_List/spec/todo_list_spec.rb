require 'todo_list'

RSpec.describe ToDoList do
    context "intiially" do
        it "constructs has an empty list" do
            todo_list = ToDoList.new
            expect(todo_list.incomplete).to eq []
        end

        it "constructs has an empty incomplete list" do
            todo_list = ToDoList.new
            expect(todo_list.incomplete).to eq []
        end

        it "constructs has an empty complete list" do
            todo_list = ToDoList.new
            expect(todo_list.complete).to eq []
        end

        # condition for if some tasks have already been completed
    end
end

