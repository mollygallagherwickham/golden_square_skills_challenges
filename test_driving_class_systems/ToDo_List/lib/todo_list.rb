# This collects the tasks from ToDo and outputs all tasks with conditions
class ToDoList
    def initialize
      @list = []
    end
  
    def add(todo) # todo is an instance of Todo
      @list << todo
    end
    
    def all
      return @list
    end

    def incomplete
      # Returns all non-done todos
      @list
    end
  
    def complete
      @list
    end
  
    def give_up!
      # Marks all todos as complete
    end 
  end 

  p todo = "Walk the dog"
  p todo1 = "Wash the dishes"
   todo_list = ToDoList.new
   todo_list.add(todo)
   todo_list.add(todo1)
  p todo_list.incomplete