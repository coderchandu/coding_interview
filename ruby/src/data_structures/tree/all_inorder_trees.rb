class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

#http://www.geeksforgeeks.org/find-all-possible-trees-with-given-inorder-traversal/
#Given an array, construct all trees which has this array value as in-order traversals
def get_all_trees_from_inorder(array, index=0)
  #In-order visits left first, then root and then right. So all elements to left belongs to left sub tree and right belongs to right subtree
  #Form all trees with next element being its right, then trees with next element as its right etc.
  # [1,2,3,4] => 
  # Consider each element as root. Left will form left subtree and right will form right subtree. Do this recursively to collect all trees


end

def preorder(root)
  return if root.nil?

  print root.value, " "
  preorder(root.left)
  preorder(root.right)
end

def inorder(root)
  return if root.nil?

  inorder(root.left)
  print root.value, " "
  inorder(root.right)
end

array = [4,6,7,1,23,441]
puts "array = #{array}"
puts "----------------"
get_all_trees_from_inorder(array).each do |root|
  preorder(root)
  puts
  inorder(root)
  puts "----------------"
end
