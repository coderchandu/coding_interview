require './tree.rb'
#   34
# 1       45
#  23   36    122 

# 12            3434
#            234

#Lowest Common ancestor of 2 nodes in BST

class CommonAncestor < Tree
  def common_ancestor(node1, node2, root=@root)
    return nil if root.nil? || root == node1 || root == node2
  
    return root if (root.data < node1.data && root.data >= node2.data) || (root.data < node2.data && root.data >= node2.data)
    return root if root.left == node1 || root.left == node2 || root.right == node1 || root.right ==node2
    common_ancestor(node1, node2, (node1.data < root.data) ? root.left : root.right)
  end
end

puts "Inside common ancestor"
tree = CommonAncestor.new([34,1,23,12,45,122, 3434, 234, 36])
tree.inorder
node1 = tree.root.right.right
node2 = tree.root.right.left
puts "Common ancestor of #{node1.data} and #{node2.data}"
puts tree.common_ancestor(node1, node2).data rescue puts "No common ancestor for #{node1.data} and #{node2.data}"
