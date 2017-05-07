require './tree.rb'

#The diameter of a tree (sometimes called the width) is the number of nodes on the longest path between two leaves in the tree. 
#        20
 #       /  \
 #      8    22
 #     / \ 
 #    4   12    
 #   /    / \
 #  2    10  14
 # /        /   
 #1        11
 #
 #here diameter is 7 and the diameter path is 1 => 2 => 4 => 8 => 12 => 14 => 11.
class Diameter < Tree
  def diameter(root=@root)
    return 0 unless root

    diameter_value = height(root.left) + height(root.right) + 1
    diameter_from_child_nodes = [diameter(root.left), diameter(root.right)].max
    [diameter_value, diameter_from_child_nodes].max 
  end

  def height(root)
    return 0 unless root
    1 + [height(root.left), height(root.right)].max
  end
end

tree = Diameter.new([20, 8, 4, 12, 10, 14, 22, 25])

puts tree.diameter
