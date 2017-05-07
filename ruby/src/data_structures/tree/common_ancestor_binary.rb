require './tree.rb'
#   34
# 1       45
#  23   36    122 

# 12            3434
#            234

#Lowest Common ancestor of 2 nodes in binary tree
class CommonAncestor < Tree
  def ancestor(node1, node2, root=@root)
    return nil if root.nil? || root == node1 || root == node2
    return root if (root.left == node1 || root.left == node2 || root.right == node1 || root.right ==node2)
    
    left = ancestor(node1, node2, root.left) 
    right = ancestor(node1, node2, root.right) 
    return root if left && right
    left ? left : right
  end

  def dfs(node1, node2, root=@root)
    return 0 unless root
    if (node1 == root || node2 == root)
      found = 1
    else
      found = 0
    end
    found = found + dfs(node1, node2, root.left)
    found += dfs(node1, node2, root.right) if found < 2
    found
  end

  def common_ancestor(node1, node2)
    #Above method return node even if only one node is present in the tree
    #First traverse the tree to make sure both node exists
    return unless dfs(node1, node2) == 2
    ancestor(node1, node2)
  end
end

puts "Inside common ancestor"
tree = CommonAncestor.new([34,1,23,12,45,122, 3434, 234, 36])
tree.inorder
node1 = tree.root.right.right.right
node2 = tree.root.right.left
puts "Common ancestor of #{node1.data} and #{node2.data}"
puts tree.common_ancestor(node1, node2).data
