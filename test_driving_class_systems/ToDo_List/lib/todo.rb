# This is to create the task and assign progression to them
class ToDo
    def initialize(task) # task is a string
      @task = task
    end
  
    def task
      fail "No task given." if @task.empty?
      return @task
    end
  
    def mark_done!
      # Marks the todo as done
      # Returns nothing
      "COMPLETE: #{@task}"
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
    end
  end 