class ToDoList
    def initialize
        @task = []
    end

    def add(text)
        @task << text
    end

    def list
        @task
    end

# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.
    def complete(text)
        @task.delete(text)
    end
    
# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.

end