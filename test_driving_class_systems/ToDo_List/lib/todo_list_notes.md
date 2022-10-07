# As a user
# I want to keep track of my tasks
# By adding to a list and assigning progress of completion to each task
```
todo_list = array
todo_list = ["todo1", "todo2"]
```

# ToDo method signatures
task method returns task
task: a string (e.g. "Walk the dog")

mark_done! method marks the task as done
mark_done: returns nothing

done? method checks if task is done
done?: boolean (e.g. true)

# ToDo examples
# Sets task and returns task
```
todo = ToDo.new("Walk the dog")
todo.task 
```
=> "Walk the dog"

# Sets task and declares done
```
todo = ToDo.new("Walk the dog")
todo_list = ToDoList.new
todo.mark_done! 
```
=>  "COMPLETE: Walk the dog"

# Sets task, declares done, then declares done again - ERROR
```
todo = ToDo.new("Walk the dog")
todo_list = ToDoList.new
todo.mark_done! 
todo.mark_done! 
```
=> "This task has already been completed."

# Sets empty task, declares done - ERROR
```
todo = ToDo.new("")
todo_list = ToDoList.new
todo.mark_done! 
```
=> "No task has been set."

# Sets task and asks if done
```
todo1 = ToDo.new("Walk the dog")
todo1.mark_done! 
# stores as "COMPLETE: Walk the dog"
todo1.done? 
```
=> true


# ToDoList method signatures

add method returns nothing
add uses an instance from ToDo and add to hash? 

incomplete method returns all incomplete to todos
incomplete: returns array

complete method returns all complete to todos
complete: returns array

give_up! method marks all todos as complete
give_up! returns nothing

# ToDoList examples


# Add one task to list
```
todo_list = ToDoList.new
todo = ToDo.new("Walk the dog")
todo_list.add(todo) 
```
=> ["Walk the dog"]

# Add multiple tasks
```
todo_list = ToDoList.new
todo1 = ToDo.new("Walk the dog")
todo2 = ToDo.new("Wash the dishes")
todo_list.add(todo1.task)
todo_list.add(todo2.task)
``` 
=>  ["Walk the dogs", "Wash the dishes"]

# Returns all tasks that are incomplete
```
todo_list = ToDoList.new
todo1 = ToDo.new("Walk the dog")
todo2 = ToDo.new("Wash the dishes")
todo_list.add(todo1.task)
todo_list.add(todo2.task) 
todo_list.incomplete 
```
=> "Walk the dog", "Wash the dishes"

# Returns all tasks that are complete
```
todo_list = ToDoList.new
todo1 = ToDo.new("Walk the dog")
todo2 = ToDo.new("Wash the dishes")
todo3 = ToDo.new("Make the dinner")
todo3.mark_done!
todo3.done? == true
todo_list.complete 
```
=> "COMPLETE: Make the dinner"

# Marks all incomplete tasks as done
```
todo_list = ToDoList.new
todo1 = ToDo.new("Walk the dog")
todo2 = ToDo.new("Wash the dishes")
todo3 = ToDo.new("Make the dinner")
todo_list.add(todo1.task)
todo_list.add(todo2.task)
todo_list.add(todo3.task)
todo_list.give_up! 
=> ["COMPLETE: Walk the dog", "COMPLETE: Wash the dishes", "COMPLETE: Make the dinner"]
```

# Marks all incomplete tasks as done
```
todo_list = ToDoList.new
todo1 = ToDo.new("Walk the dog")
todo2 = ToDo.new("Wash the dishes")
todo3 = ToDo.new("Make the dinner")
to_dolist.add(todo1.mark_done!)
todo_list.add(todo2.task)
todo_list.add(todo3.task)
todo_list.give_up! 
```
=> ["COMPLETE: Walk the dog", "COMPLETE: Wash the dishes", "COMPLETE: Make the dinner"]





# what happens with a to do list
1. A list is created
2. A task is created
3. That task is assumed incomplete until marked done
4. That task is added to the list
5. Updates are given to task (usually just to say it's been completed)
6.  List updated
