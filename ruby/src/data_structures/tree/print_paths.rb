require './tree.rb'
class PrintPaths < Tree
  #Find if there is a route from root till leaf with given sum
  def has_path_from_root_with_sum?(root=@root, sum)
    return (sum == 0) if root.nil?
    return true if root.data == sum
    has_path_from_root_with_sum?(root.left, sum-root.data) || 
      has_path_from_root_with_sum?(root.right, sum-root.data)
  end

  #Find if there is a route in given tree with given sum
  #For each node, see if there is a path starting from that node till root has given sum
  def has_path_sum?(sum, root=@root, array_so_far=[], level=0)
    return (sum == 0) if root.nil?
    sum_so_far = 0
    array_so_far[level] = root.data
    i = level
    while (i >= 0)
      sum_so_far += array_so_far[i]
      return true if sum_so_far == sum
      i -= 1 
    end
    array_left = array_so_far.clone
    array_right = array_so_far.clone
    has_path_sum?(sum, root.left, array_left, level+1) || has_path_sum?(sum, root.right, array_right, level+1)
  end

  #Find if there is a route in given tree with given sum
  #For each node, see if there is a path starting from that node till root has given sum
  def print_paths_with_sum(sum, root=@root, array_so_far=[], level=0)
    return (sum == 0) if root.nil?
    sum_so_far = 0
    array_so_far[level] = root.data
    i = level
    while (i >= 0)
      sum_so_far += array_so_far[i]
      if sum_so_far == sum
        for index in i..level
          print array_so_far[index]
          print " => " if index!=level
        end
        puts ""
      end
      i -= 1 
    end
    array_left = array_so_far.clone
    array_right = array_so_far.clone
    print_paths_with_sum(sum, root.left, array_left, level+1)
    print_paths_with_sum(sum, root.right, array_right, level+1)
  end

end

tree = PrintPaths.new([60,20,30,40,80,70,65])
print "sum=80 "
tree.print_paths_with_sum(80)
print "sum=50 "
tree.print_paths_with_sum(50)
print "sum=70 "
tree.print_paths_with_sum(70)
print "sum=90 "
tree.print_paths_with_sum(90)
print "sum=150 "
tree.print_paths_with_sum(150)
print "sum=136 "
tree.print_paths_with_sum(136)
print "sum=140 "
tree.print_paths_with_sum(140)
      
