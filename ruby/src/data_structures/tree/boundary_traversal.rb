require './tree.rb'

class BoundaryTraversal < Tree
  def print_tree(ptr=@root)
    return unless ptr
    printLeftBoundary(ptr)
    printLeafNodes(ptr)
    printRightBoundary(ptr.right)
  end
 
  def printLeftBoundary(ptr)
    return unless ptr
    print ptr.data, " " unless leaf_node?(ptr)
    if (ptr.left)
      printLeftBoundary(ptr.left)
    elsif (ptr.right)
      printLeftBoundary(ptr.right)
    end
  end
 
  def printRightBoundary(ptr)
    return if ptr.nil?
    if ptr.right
      printRightBoundary(ptr.right)
    elsif ptr.left
      printRightBoundary(ptr.right)
    end
    print ptr.data, " " unless leaf_node?(ptr)
  end

  def printLeafNodes(ptr)
    return unless ptr

    printLeafNodes(ptr.left)
    print ptr.data, " " if leaf_node?(ptr)
    printLeafNodes(ptr.right)
  end

  def leaf_node?(ptr)
    ptr.left.nil? && ptr.right.nil?
  end
end

tree = BoundaryTraversal.new([20, 8, 4, 12, 10, 14, 22, 25])

puts "Expected [20, 8, 4, 10, 14, 25, 22] => ", tree.print_tree
