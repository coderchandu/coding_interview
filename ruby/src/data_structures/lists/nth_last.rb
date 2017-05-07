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
 
  def nth_last(n)
    # Nth node from last
    # 1 -> 2 -> 3 -> 4 -> 5
    return nil if n <= 0

    ptr = @head
    nth_node = @head
    for i in 1..n
      return nil unless ptr
      ptr = ptr.next_node
    end
    while (ptr)
      ptr = ptr.next_node
      nth_node = nth_node.next_node
    end
    nth_node.data if nth_node
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
puts "1st", list.nth_last(1)
puts "2nd",list.nth_last(2)
puts "0", list.nth_last(0)
puts "6th", list.nth_last(6)
puts "7th", list.nth_last(7)
