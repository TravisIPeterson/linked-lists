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
            @tail.next_node = new_node
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
        until current_node.next_node.nil?
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

    def pop
        if size == 1
            @head = nil
            @tail = nil
        else
            current_node = @head
            until current_node.next_node == @tail
                current_node = current_node.next_node
            end
            current_node.next_node = nil
            @tail = current_node
        end
    end

    def contains?(value)
        current_node = @head
        contains = false
        until current_node.nil?
            contains = true if current_node.value == value
            current_node = current_node.next_node
        end
        contains
    end

    def find(value)
        index = nil
        current_index = 0
        current_node = @head
        until current_node.next_node == nil
            index = current_index if current_node.value == value
            current_index += 1
            current_node = current_node.next_node
        end
        index
    end

    def to_s
        current_node = @head
        node_string = ""
        until current_node.nil?
            node_string += " ( #{current_node.value} ) -> "
            current_node = current_node.next_node
        end
        node_string += "nil"
        node_string
    end

end

list = LinkedList.new
list.append(3)
list.append(4)
list.prepend(17)
list.append(5)
list.append(1)
list.append(8)
p list.tail
p list.size
p list
list.pop
puts '-------------------------------'
p list.tail
p list.size
p list
p list.head
p list.tail
puts list.contains?(17)
puts list.contains?(56)
p list.find(17)
p list.find(56)
puts list.to_s