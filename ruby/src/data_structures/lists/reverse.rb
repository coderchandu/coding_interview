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
 
  def reverse_list
    prev = nil
    ptr = @head
    while (ptr)
      tmp = ptr.next_node
      ptr.next_node = prev
      prev = ptr
      ptr = tmp
    end
    @head = prev
  end

  def reverse_recurse(node=@head)
    return node if node.nil? || node.next_node.nil?

    
    @head = reverse_recurse(node.next_node)
    node.next_node.next_node = node
    node.next_node = nil
    @head
  end
end

list = LinkedList.new
list.add_to_head(10)
list.add_to_head(20)
list.add_to_head(30)
list.add_to_head(40)
list.add_to_head(50)
list.print_list
puts "reversed"
list.reverse_list
list.print_list
puts "reversing again"
list.reverse_recurse
list.print_list
