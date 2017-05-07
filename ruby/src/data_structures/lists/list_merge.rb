#Find merging point if 2 link list merges

# If it merges, last node will be same. Traverse both lists till end, if
# last node matches, get size of each lists
# size1 - size2 => length difference before merging point as number of 
# nodes after merging point is same. Then traverse big list that much time and then
# traverse both list together till it meets 
class List
  attr_accessor :head

  class Node
    attr_accessor :next, :data
    def initialize(data)
      @data = data
    end
  end

  def addToHead(node)
    node.next = @head
    @head = node
  end
end

class ListMerge
  attr_accessor :list1, :list2

  def initialize(list1, list2)
    @list1 = list1
    @list2 = list2
  end 

  def findMergePoint
    size1 = 0
    size2 = 0
    ptr1 = @list1.head
    ptr2 = @list2.head
    return nil unless ptr1 && ptr2
    while (ptr1.next)
      ptr1 = ptr1.next
      size1 += 1
    end
    while (ptr2.next)
      ptr2 = ptr2.next
      size2 += 1
    end
    return nil unless ptr1 == ptr2

    ptr1 = @list1.head
    ptr2 = @list2.head
    diff = 0
    if size1 > size2
      for i in 1..(size1 - size2)
        ptr1 = ptr1.next
      end
    elsif size2 > size1
      for i in 1..(size2 - size1)
        ptr2 = ptr2.next
      end
    end
    while (ptr1!=ptr2)
      ptr1=ptr1.next
      ptr2=ptr2.next
    end
    ptr1.data if ptr1
  end
end

l1 = List.new
l2 = List.new
node = List::Node.new(9)
l1.addToHead(List::Node.new(4))
l1.addToHead(List::Node.new(5))
l1.addToHead(node)
l1.addToHead(List::Node.new(6))
l1.addToHead(List::Node.new(7))
l2.addToHead(List::Node.new(1))
l2.addToHead(List::Node.new(2))
l2.addToHead(node)
puts "MErging => #{ListMerge.new(l1,l2).findMergePoint}"
