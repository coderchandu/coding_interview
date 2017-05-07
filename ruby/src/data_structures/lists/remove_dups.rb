class LinkedList
  attr_reader :head

  class Node
    attr_accessor :data, :next_node
    def initialize(data)
      @data = data
      @next_node = nil
    end
  end

  def initialize
    @head = nil
  end

  def add_to_head data
    node = Node.new(data)
    node.next_node = @head
    @head = node
  end

  def print_list
    ptr = @head
    while(ptr)
      print ptr.data, " "
      ptr = ptr.next_node
    end
  end
 
  def remove_dups
    hash = {}
    prev = nil
    ptr = @head
    while (ptr)
      if hash.key?(ptr.data)
        prev.next_node = ptr.next_node
      else
        hash[ptr.data] = true
        prev = ptr
      end
      ptr = ptr.next_node
    end
  end

  def remove_without_buffer
    ptr = @head.next_node
    prev = @head

    while(ptr)
      runner = @head
      
      while (runner != ptr)
        if runner.data == ptr.data
          prev.next_node = ptr.next_node
          ptr = prev
          break
        end 
        runner = runner.next_node
      end
      prev = ptr
      ptr = ptr.next_node
    end
  end
end

list = LinkedList.new
list.add_to_head(50)
list.add_to_head(10)
list.add_to_head(20)
list.add_to_head(30)
list.add_to_head(40)
list.add_to_head(50)
list.print_list
list.remove_without_buffer
puts "Remove dups"
list.print_list
