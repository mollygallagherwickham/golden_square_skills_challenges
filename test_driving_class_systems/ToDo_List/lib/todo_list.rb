# This collects the tasks from ToDo and outputs all tasks with conditions
class ToDoList
    def initialize
      @list = []
    end
  
    def add(todo) # todo is an instance of Todo
      @list << todo
    end

    def all
      @list
    end

    def incomplete
      @list - complete
    end
  
    def complete
      # Returns all complete todos
      # somehow associated with 'done?' from ToDo class?  
      @list.select{|todo| todo.include? "COMPLETE" }
    end
  
    def give_up!
      # Marks all todos as complete
      # connection to mark_done! ?
      @list.map do |entry|
        if entry.include?("COMPLETE")
          entry
        else
        "COMPLETE: #{entry}"
        end
      end
    end 
  end 