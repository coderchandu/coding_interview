class LinkedList
  attr_reader :head

  class Node
    attr_reader :data
    attr_accessor :next_node
   
    def initialize(data)
      @data = data
      @next_node = nil
    end
  end
 
  def addToTail(data)
    new_node = Node.new(data)
    unless @head
      @head = new_node
      return
    end
    tmp = @head
    tmp = tmp.next_node while(tmp.next_node)
    tmp.next_node = new_node
  end
 
  def initialize(arr=nil)
    return unless arr
    @head = Node.new(arr[0])
    for i in 1..arr.size-1
      addToTail(arr[i])
    end
  end

  def print_list
    tmp = @head
    while tmp != nil
      puts tmp.data
      tmp = tmp.next_node
    end
  end

  def delete_data(data)
    if @head.data == data
      @head = @head.next_node
      return
    end

    tmp = @head
    while (tmp.next_node != nil && tmp.next_node.data == data) do
      tmp.next_node = tmp.next_node.next_node
    end
    @head
  end
end

list = LinkedList.new([34, 123, 11, 222])
list.print_list

puts "Deleting 123"
list.delete_data(123)
list.print_list

puts "Deleting 34"
list.delete_data(34)
list.print_list

puts "Deleting 123"
list.delete_data(123)
list.print_list

puts "Deleting 222"
list.delete_data(222)
list.print_list

puts "Deleting 11"
list.delete_data(11)
list.print_list

