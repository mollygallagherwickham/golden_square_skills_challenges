class Task
    def initialize(todo)
        @todo = todo
    end

    def task
        # returns string
        return fail "Task is empty" if @todo.empty?
        return @todo
    end

    def mark_task_done
        # takes string as parameter ("walk the dog") and marks as done
        return "√ #{@todo}"
    end
end
