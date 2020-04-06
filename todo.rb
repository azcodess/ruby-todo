
class Item
    attr_reader :is_done, :title
    def initialize(text)
    @is_done = text[0]
    @title = text[0..-1]
    end

    def finished?
        is_done == "x"
    end
end

class Todo
    def initialize(task_file = "task_file.data")
        puts "welcome to TODO app: "
        file = File.open(task_file)
        data = file.read
        @list = []
        data.lines.each do |line|
            @list << Item.new(line)
        end
    end

    def display
        puts "here are your tasks for the day"
        @list.each_with_index do |item, index|
            if item.finished?
            else
                puts "#{index+1}. #{item.title}"
            end
            
       end
    end
end

todo = Todo.new
todo.display
