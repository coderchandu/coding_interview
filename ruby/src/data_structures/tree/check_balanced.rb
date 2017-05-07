#Check if a binary tree is balanced or not
#A tree is not balanced if there are 2 leaf nodes whose distance
#from root node differs by more than one
class BinaryTree
  attr_accessor :root

  class Node
    attr_accessor :left, :right, :data

    def initialize(data)
      @data = data
    end
  end

  def createTree(arr)
    @root = createBalancedTree(arr, 0, arr.size-1)
  end

  def createBalancedTree(arr, first, last)
    return nil if first>last
    mid = (first+last)/2
    node = Node.new(arr[mid])
    node.left = createBalancedTree(arr, first, mid-1)
    node.right = createBalancedTree(arr, mid+1, last)
    node
  end

  def createBst(arr)
    @root = Node.new(arr[0])
    for i in 1..arr.size-1
      ptr = @root
      prev = @root
      node = Node.new(arr[i])
      while (ptr)
        prev = ptr
        if arr[i] < ptr.data
          ptr = ptr.left
        else
          ptr = ptr.right
        end
      end
      if arr[i] < prev.data
        prev.left = node
      else
        prev.right = node
      end
    end
    @root
  end

  def inorder(root)
    return nil unless root
    inorder(root.left)
    puts root.data
    inorder(root.right)
  end

  def minDepth(root)
    leftDepth = root.left ? minDepth(root.left) : 0
    rightDepth = root.right ? minDepth(root.right) : 0
    1 + [leftDepth, rightDepth].min
  end

  def maxDepth(root)
    leftDepth = root.left ? maxDepth(root.left) : 0
    rightDepth = root.right ? maxDepth(root.right) : 0
    1 + [leftDepth, rightDepth].max
  end

  def balanced?
    maxDepth(@root) - minDepth(@root) <= 1 
  end
end

tree = BinaryTree.new
root = tree.createBst([4,5, 3])
puts tree.inorder(root)
puts tree.balanced?
