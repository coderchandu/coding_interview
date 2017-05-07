#Print Left View of a Binary Tree
# Set of nodes visible when viewed from left
class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @left = @right = nil
    @data = data
  end
end

class Queue
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(data)
    node = Node.new(data)
    if @tail.nil?
      @head = node
      @tail = node
    else
      @tail.right = node
      @tail = node
    end
  end

  def dequeue
    return nil if @head.nil?
    value = @head.data
    @head = @head.right
    @tail = nil if @head.nil? 
    value
  end

  def empty?
    @head.nil?
  end
end


class BinaryTree
  attr_accessor :root
  def initialize(arr=nil)
    if arr.nil?
      @root=nil
    else
      @root = create_balanced_binary_tree(arr, 0, arr.size-1)
    end
    @hash = {}
  end

  #1 Do inorder which traverses left branch first. Use hash to mark visits
  #2 Do BFS. Mark starting of each level and print the node
  def left_view(root=@root, level=0)
    return unless root
    left_view(root.left, level+1)
    unless @hash.key?(level)
      puts root.data
      @hash[level] = true
    end
    left_view(root.right, level+1)
  end

  def pretty_print(root=@root)
    return unless root
    queue = Queue.new
 
    space = 48
    empty_node = Node.new("  ")
    print " "*space
    queue.enqueue(root)
    queue.enqueue(nil)
    while (!queue.empty?)
      node = queue.dequeue
      if node.nil?
        puts ""
        puts ""
        space -=3
        queue.enqueue(nil) unless queue.empty?
        print " "*space
      else
        print node.data, " "*3
        if node.left
          queue.enqueue(node.left)
        elsif node.right
          queue.enqueue(empty_node)
        end
        if node.right
          queue.enqueue(node.right)
        elsif node.left
          queue.enqueue(empty_node)
        end
      end
    end
  end
  
  def inorder(root=@root)
    return if root.nil?

    inorder(root.left)
    puts root.data
    inorder(root.right)
  end

  def create_balanced_binary_tree(arr, low, high)
    return nil if arr.nil? || arr == []
    return nil if low > high 
    mid = (low + high)/2
    node = Node.new(arr[mid])
    node.left = create_balanced_binary_tree(arr, low, mid-1) if low<=(mid-1)
    node.right = create_balanced_binary_tree(arr, mid+1, high) if (mid+1)<=high
    node
  end
end

tree = BinaryTree.new([90,12,44,1,22,4,14])
tree.inorder
tree.pretty_print
puts "left view ======"
tree.left_view

tree = BinaryTree.new
tree.root = Node.new(12)
tree.root.left = Node.new(10)
tree.root.right = Node.new(30)
tree.root.right.left = Node.new(25)
tree.root.right.right = Node.new(40)
tree.left_view
