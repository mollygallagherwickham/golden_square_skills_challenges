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

    # it "fails when task is already complete" do
    #     todo = ToDo.new("Walk the dog")
    #     todo.mark_done! 
    #     expect{ todo.mark_done! }.to raise_error "Task cannot be set to complete."
    # end

    # it "fails when task is empty" do
    #     todo = ToDo.new("")
    #     expect{ todo.mark_done! }.to raise_error "Task cannot be set to complete."
    # end

    it "checks task is not done" do
        todo = ToDo.new("Walk the dog") 
        expect(todo.done?).to eq false
    end

    it "checks task is done" do
        todo = ToDo.new("Walk the dog") 
        todo.mark_done!
        expect(todo.done?).to eq true
    end

    # it "fails to check if done when task is empty" do
    #     todo = ToDo.new("")
    #     expect{ todo.done? }.to raise_error "Task is empty."
    # end
end

