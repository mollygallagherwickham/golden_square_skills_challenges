require 'todo'

RSpec.describe ToDo do
        it "constructs task" do
            todo = ToDo.new("Walk the dog")
            expect(todo.task).to eq "Walk the dog"
        end

        it "fails when no task given" do
            todo = ToDo.new("")
            expect{ todo.task }.to raise_error "No task given."
        end

        it "marks task as done" do
            todo = ToDo.new("Walk the dog")
            expect(todo.mark_done!).to eq "COMPLETE: Walk the dog"
        end
end