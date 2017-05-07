class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

#https://www.youtube.com/watch?v=rvMOG_yKBA0
#Given an array, construct all trees which has this array value as pre-order traversals
def get_all_trees_from_preorder(array, start=0, end_index=array.size-1)
  #Pre-order visits root first. So 1st element is always root of the tree. next element could be left or right
  #Form all trees with next element being its left, then trees with next element as its right etc.
  # [1,2,3,4] => Use DP approach, bottom up approach. Go all the way down to last 2 nodes
  #       3             3
  #     4       and       4
  #  Now 2 can be added as the root and left could be 3 and right could be 3
  #                                                 4                         4
  #  And follow this till root
  if (start == array.size-1)
    return [Node.new(array[start])]
  end
  results = []
  trees = get_all_trees_from_preorder(array, start+1, end_index-1)
  trees.each do |tree|
    node1 = Node.new(array[start])
    node1.left = tree
    results << node1
    node2 = Node.new(array[start])
    node2.right = tree
    results << node2
  end
  results
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

#Test, make sure all pre order traversals results in the input array and make sure inorder
#traversals are all different
array = [1, 2, 3]
puts "array = #{array}"
puts "----------------"
values = get_all_trees_from_preorder(array)
puts values.size
values.each do |root|
  #preorder(root)
  puts
  inorder(root)
  puts "----------------"
end
