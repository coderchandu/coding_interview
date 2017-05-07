#Given a stream of objects, find first unique object
#If stream is A B C A B C A D => First unique char is D. If stream is A B C => first unique char is A

#Approach => Store each char in hash map, create a node in doubly linked list and store its value in hash
#If repeated, we can remove it from the list and update node status to inactive in the node (Or give hash map value as null)
#Once all stream objects are parsed, return head node of the list

class Stream
  attr_accessor :index, :str

  def initialize(str)
    @str = str
    @index = 0
  end

  def hasNext
    @index <= @str.size
  end

  def getNext
    @index += 1
    @str[@index-1]
  end
end

def getFirstUniqChar(stream)
  hash = {}
  list = DoublyLinkedList.new
  while (stream.hasNext)
    obj = stream.getNext
    if (hash.key?(obj))
      #Repeated. Delete from the list
      list.delete_node(hash[obj]) if hash[obj]
    else
      #First time. Add to list and to the hash
      node = list.add_node_to_head(hash[obj])
      hash[obj] = node
    end
  end
  list.head.data if list.head
end


