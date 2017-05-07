#single linked list with an extra pointer which is pointing randomly to some nodes in the list. i.e, the random pointer of 2nd node may point to 1st one or to any other nodes in the list. WAP to copy this list.

class List
  class Node
    attr_accessor :data, :next, :random_ptr
    def initialize(data)
      @data = data
    end
  end

  attr_accessor :head

  def clone_list(head)
    return unless head
    ptr = head.next
    prev = nil
    new_head = Node.new(head.data)
    new_ptr = new_head
    hash = {head => new_head}
    while (ptr)
      new_node = Node.new(ptr.data)
      hash[ptr] = new_node
      new_ptr.next = new_node
      ptr = ptr.next
      new_ptr = new_node
    end

    ptr = head
    while (ptr)
      hash[ptr].random_ptr = hash[ptr.random_ptr]
      ptr = ptr.next
    end
  end
end

