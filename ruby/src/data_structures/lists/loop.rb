# Find if there is a loop in the list
class List
  attr_accessor :head
  class Node
    attr_accessor :data, :next
    def initialize(data)
      @data = data
      @next = nil
    end

    def set_next(ptr)
      @next = ptr
    end
  end
 
  def loop_meeting_point
    return false unless @head
    ptr = @head
    fast_ptr = ptr.next
    while(fast_ptr)
      return ptr if ptr == fast_ptr
      ptr = ptr.next
      fast_ptr = fast_ptr.next
      fast_ptr = fast_ptr.next if fast_ptr
    end
    false
  end

  def addToHead(data)
    node = Node.new(data)
    node.next = @head if @head
    @head = node
  end
  
  def addNodeToTail(node)
    ptr = @head
    unless @head
      @head = node
      return
    end
    ptr = ptr.next while (ptr.next)
    ptr.next = node
  end

  def print_data
    ptr = @head
    while(ptr)
      print ptr.data, " "
      ptr = ptr.next
    end
    puts ""
  end

  # Find length of loop by traversing through loop after 1st meeting
  # Fast ptr meets slow ptr exactly at same 1st meeting point and number
  # of iterations in between gives the length of the loop
  # After that we can use nth last node logic to find start of the loop
  def first_node_in_loop
    ptr = loop_meeting_point
    return nil unless ptr
    fast_ptr = ptr
    length = 0
    begin
      ptr = ptr.next
      fast_ptr = fast_ptr.next.next
      length += 1
    end until (ptr == fast_ptr)
    nth_node_from_last(length)
  end

  def nth_node_from_last(n)
    ptr = @head
    for i in 1..n
      ptr = ptr.next
      return nil unless ptr
    end
    nth_node = @head
    while (nth_node.next != ptr.next)
      nth_node = nth_node.next
      ptr = ptr.next
    end
    nth_node.next
  end
end

list = List.new
list.addToHead(3)
list.addToHead(6)
list.addToHead(9)
list.addToHead(12)
list.addToHead(15)
node = List::Node.new(20)
node.set_next(list.head.next)
list.addNodeToTail(node)
puts list.first_node_in_loop.data
