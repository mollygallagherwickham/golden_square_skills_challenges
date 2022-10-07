# This is to create the task and assign progression to them
class ToDo
    def initialize(task) # task is a string
      @task = task
    end
  
    def task
      fail "No task given." if @task.empty?
      @task
    end

    def mark_done!
      # Marks the todo as done
      # Returns nothing
      # fail "Task cannot be set to complete." if (@task.empty? || @task.include?("COMPLETE"))
      return @task = "COMPLETE: #{@task}"
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      # fail "Task is empty." if @task.empty?
      @task.start_with? "COMPLETE"
    end
  end 