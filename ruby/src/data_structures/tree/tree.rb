class Tree
  attr_accessor :root

  class Node
    attr_accessor :data, :parent, :left, :right

    def initialize(data)
      @data = data
      @left = nil
      @right = nil
      @parent = nil
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

  def initialize(arr=[])
    @root = nil
    arr.each do |data|
      insert_node_to_bst(data)
    end
  end

  #DFS
  def inorder(root=@root)
    return if root == nil
    inorder(root.left)
    puts root.data
    inorder(root.right)
  end

  #DFS
  def preorder(root=@root, num_spaces=36)
    return if root == nil
    print " " * num_spaces
    puts root.data
    preorder(root.left, num_spaces - 4)
    preorder(root.right, num_spaces + 4)
  end

  #DFS
  def postorder(root=@root)
    return if root == nil
    postorder(root.left)
    postorder(root.right)
    puts root.data
  end

  def bfs(root=@root)
    return unless root
    queue = Queue.new
  
    queue.enqueue(root)
    queue.enqueue(nil)
    while (!queue.empty?)
      node = queue.dequeue
      if node.nil?
        puts ""
        queue.enqueue(nil) unless queue.empty?
      else
        print node.data, " "
        queue.enqueue(node.left) if node.left 
        queue.enqueue(node.right) if node.right
      end
    end
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

  def insert_node_to_bst(data)
    node = Node.new(data)
    unless @root
      @root = node
      return node
    end
    ptr = @root
    parent = nil
    while (ptr != nil)
      parent = ptr
      ptr = (data < ptr.data) ? ptr.left : ptr.right
    end
    if (data < parent.data)
      parent.left = node
    else
      parent.right = node
    end
    node.parent = parent
    node
  end
end

arr = []
for i in 1..10
  arr << rand(1..100)
end

puts "array = #{arr}"
tree = Tree.new(arr)
puts "Inorder"
puts tree.inorder
puts "Preorder"
puts tree.preorder
puts "Post order"
puts tree.postorder
puts "BFS"
puts tree.bfs
puts "Treeee"
puts tree.pretty_print
