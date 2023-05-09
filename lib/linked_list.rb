require_relative 'node'

class LinkedList
    attr_reader :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
            @tail = new_node
        else
            current_node = @tail
            current_node.next_node = new_node
            @tail = new_node
        end
    end

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    def size
        counter = 0
        current_node = @head
        until @head.next_node.nil?
            current_node = current_node.next_node
            counter += 1
        end
        counter
    end

    def at(index)
        counter = 0
        current_node = @head
        until counter == index
            current_node = current_node.next_node
            counter += 1
        end
        current_node.value
    end

end

list = LinkedList.new
list.append(3)
list.append(4)
list.prepend(17)
p list
p list.at(1)