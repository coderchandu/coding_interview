require './tree.rb'

# For small trees: For one tree to be subtree of other:
# preorder of sub-tree must be a substring of preorder of actual tree
# inorder of sub-tree must be a substring of inorder of actual tree
class SubTree < Tree
  #considering it as big tree with millions of nodes - we cannot go with above approach
  def sub_tree?(tree, sub_tree)
    return true unless sub_tree #Considering empty tree as a sub tree
    return false unless tree
  
    match_found = match_tree?(tree, sub_tree) if tree.data == sub_tree.data
    return true if match_found
    sub_tree?(tree.left, sub_tree) || sub_tree?(tree.right, sub_tree)  
  end

  def match_tree?(tree, sub_tree)
    return true if tree.nil? && sub_tree.nil?
    return false if tree.nil? || sub_tree.nil?
    return false if tree.data != sub_tree.data

    match_tree?(tree.left, sub_tree.left) && match_tree?(tree.right, sub_tree.right)
  end 
end

tree = SubTree.new([2,4,5,7,8,9])
tree2 = SubTree.new([4,5,6])

puts "true expecting: ", tree.sub_tree?(tree.root, tree.root.left)
puts "false expecting: ", tree.sub_tree?(tree.root, tree2.root)
