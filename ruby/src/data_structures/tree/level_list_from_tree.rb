require "../lists/linked_list.rb"
require "../queue.rb"
class Tree
  attr_accessor :root
  
  class Node
    attr_accessor :data, :left, :right

    def initialize(data)
      @data = data
    end
  end

  def add_data_to_bst(data)
    node = Node.new(data)
    unless @root
      @root = node
      return
    end
 
    ptr = @root
    prev = @root
    while (ptr)
      prev = ptr
      if (data < ptr.data)
        ptr = ptr.left
      else
        ptr = ptr.right
      end
    end
    if (data < prev.data)
      prev.left = node
    else
      prev.right = node
    end
  end

  def inorder(root=@root)
    return unless root
    inorder(root.left)
    print root.data, " "
    inorder(root.right)
  end

  def create_level_lists
    queue = Queue.new
    queue.enqueue(@root)
    queue.enqueue(nil)
    list = LinkedList.new
    lists = []
    while(!queue.empty?)
      node = queue.dequeue
      unless node
        lists << list
        list = LinkedList.new
        queue.enqueue(nil) unless queue.empty?
        next
      end
      list.addToTail(node)
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
    lists
  end
end


tree = Tree.new
tree.add_data_to_bst(4)
tree.add_data_to_bst(2)
tree.add_data_to_bst(12)
tree.add_data_to_bst(6)
tree.add_data_to_bst(1)
tree.add_data_to_bst(14)
tree.add_data_to_bst(8)

tree.inorder
puts "\nStarting level creation"
lists = tree.create_level_lists
puts "List size=#{lists.size}"
lists.each do |list|
  ptr = list.head
  while (ptr)
    print ptr.data.data
    ptr = ptr.next_node
    print " -> " if ptr
  end
  puts ""
end
