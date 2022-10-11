require 'task'

RSpec.describe Task do
    it "creates one task" do
        task1 = Task.new("Wash the dishes")
        expect(task1.task).to eq "Wash the dishes"
    end

    it "fails when task is empty" do
        task1 = Task.new("")
        expect { task1.task }.to raise_error "Task is empty"
    end

    it "creates task and marks as done" do
        task1 = Task.new("Wash the dishes")
        expect(task1.mark_task_done).to eq "√ Wash the dishes"
    end
end