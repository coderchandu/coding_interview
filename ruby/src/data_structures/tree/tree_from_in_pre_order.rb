#Given an inorder and pre order traversal arrays, construct the binary tree
#Pre order always starts with root. Inorder has left elements in the left subtree and
#right elements in right subtree. Consider no duplicates
#2. If there are duplicates, find all combination of trees
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
@@index = 0
def constructTree(inorder, preorder, start_index=0, end_index=inorder.size-1)
  if (start_index > end_index)
    return nil
  end
  node = Node.new(preorder[@@index])
  inorder_index = inorder.find_index(preorder[@@index])
  @@index += 1
  if (inorder_index)
    node.left = constructTree(inorder, preorder, start_index, inorder_index-1)
    node.right = constructTree(inorder, preorder, inorder_index+1, end_index)
  else
    raise "Error while finding inorder index"
  end
  return node
end

def self.inorder(root)
  return if root.nil?
  inorder(root.left)
  print " #{root.data} "
  inorder(root.right)
end

def self.preorder(root)
  return if root.nil?
  print " #{root.data} "
  preorder(root.left)
  preorder(root.right)
end
end

pre=[1,2]
inorder=[2,1]
root = Tree.new.constructTree(inorder, pre)

puts "pre order: #{Tree.preorder(root)}"
puts "in order: #{Tree.inorder(root)}"
