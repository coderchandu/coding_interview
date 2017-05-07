require './tree.rb'
class IsBST < Tree
  def is_bst?
    is_bst?(@root, nil, nil)
  end

  def is_bst?(root, min, max)
    return true unless root
    
    return false if min && root.data < min
    return false if max && root.data > max
    is_bst?(root.left, min, root.data-1) && is_bst?(root.right, root.data, max)
  end
end
