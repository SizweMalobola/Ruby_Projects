class Node
    attr_accessor :value,:next_node
    def initialize(value)
        self.value = value
        self.next_node = nil
    end
end

class LinkedList
    attr_accessor :head,:tail,:length
    def initialize
        self.head = nil
        self.tail = nil
        self.length = 0
    end

    def append(value)
        new_node = Node.new(value)
        if self.head.nil?
            self.head = new_node
            self.tail = self.head
        else
            self.tail.next_node = new_node
            self.tail = self.tail.next_node
        end
        self.length += 1
        self
    end

    def prepend(value)
        new_node = Node.new(value)
        if self.head.nil?
            self.head = new_node
            self.tail = self.head
        else
            new_node.next_node = self.head
            self.head = new_node
        end
        self.length += 1
        self
    end

    # def size
    #     "The "self.length
    # end

    # def head
    #     self.head
    # end
    
    # def tail
    #     self.tail
    # end

    def at(index)
        return nil if index >= self.length || index < 0
        current_node = self.head
        counter = 0
        until index == counter
            counter += 1
            current_node = current_node.next_node
        end
        current_node
    end

    def pop
        return nil if self.head.nil?
        current_node = self.head
        temp = current_node
        until current_node.next_node.nil?
            temp = current_node
            current_node = current_node.next_node
        end
        temp.next_node = nil
        self.tail = temp
        self.length -= 1
        if self.length == 0
            self.head = nil
            self.tail = nil
        end
        current_node
    end

    def contains?(value)
        return false if self.head.nil?
        current_node = self.head
        found = false
        until current_node.nil? || found == true
            found = true if value == current_node.value
            current_node = current_node.next_node
        end
        found
    end

    def find(value)
        if self.head.nil?
            nil
        elsif !self.contains?(value)
            nil
        else
            current_node = self.head
            index = 0
            until current_node.value == value
                index += 1
                current_node = current_node.next_node
            end
            index
        end
    end

    def to_s
        return nil if self.head.nil?
        current_node = self.head
        string = "(#{current_node.value})"
        (self.length - 1).times do
            current_node = current_node.next_node
            string += " -> (#{current_node.value})" 
        end
        string += " -> nil"
    end

    def insert_at(value,index)
        if index > self.length || index < 0
            false
        elsif index == self.length
            self.append(value) 
            true
        elsif index == 0
            self.prepend(value)
            true
        else
            new_node = Node.new(value)
            prev = self.at(index - 1)
            new_node.next_node = prev.next_node
            prev.next_node = new_node
            self.length += 1
            true
        end
    end

    def remove_at(index)
        if index >= self.length || index < 0
            nil
        elsif index == 0
            current_node = self.head
            self.head = current_node.next_node
            self.length -= 1
            if self.length == 0
                self.head = nil
                self.tail = nil
            end
            current_node
        elsif index == self.length - 1
            self.pop
        else
            prev = self.at(index - 1)
            remove = prev.next_node
            prev.next_node = remove.next_node
            self.length -= 1
            if self.length == 0
                self.head = nil
                self.tail = nil
            end
            remove
        end
    end

end

list = LinkedList.new
list.append("TEN")
list.append(10)
list.prepend("first")
list.prepend("zero")
p list.remove_at(3)
p list.to_s
