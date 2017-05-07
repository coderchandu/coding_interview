require "./tree.rb"

class InorderSuccessor
  #its in the right subtree if there is right node(left most child in the subtree)
  #its the parent if node is left child of parent
  #If node is right child of parent, go up until node is left child of parent
  def successor_node(node)
    return nil unless node
    if node.right
      successor = node.right
      successor = successor.left while (successor.left)
      return successor
    end
    node = node.parent while (node.parent && node.parent.right == node)
    node.parent
  end  
end

tree = Tree.new
node1 = tree.insert_node_to_bst(3)
node2 = tree.insert_node_to_bst(13)
node3 = tree.insert_node_to_bst(31)
node4 = tree.insert_node_to_bst(3)
node5 = tree.insert_node_to_bst(30)
node6 = tree.insert_node_to_bst(20)
node7 = tree.insert_node_to_bst(4)
tree.inorder
puts "", "Successor of #{node1.data} = #{InorderSuccessor.new.successor_node(node1).data}" rescue puts "no successor for #{node1.data}"
puts "", "Successor of #{node2.data} = #{InorderSuccessor.new.successor_node(node2).data}" rescue puts "no successor for #{node2.data}"
puts "", "Successor of #{node3.data} = #{InorderSuccessor.new.successor_node(node3).data}" rescue puts "no successor for #{node3.data}"
puts "", "Successor of #{node4.data} = #{InorderSuccessor.new.successor_node(node4).data}" rescue puts "no successor for #{node4.data}"
puts "", "Successor of #{node5.data} = #{InorderSuccessor.new.successor_node(node5).data}" rescue puts "no successor for #{node5.data}"
puts "", "Successor of #{node6.data} = #{InorderSuccessor.new.successor_node(node6).data}" rescue puts "no successor for #{node6.data}"
puts "", "Successor of #{node7.data} = #{InorderSuccessor.new.successor_node(node7).data}" rescue puts "no successor for #{node7.data}"
