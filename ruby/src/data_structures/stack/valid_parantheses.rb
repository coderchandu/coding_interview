class Stack
  attr_accessor :top, :size

  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
    end
  end

  def initialize
    @top = nil
    @size = 0
  end

  def push(data)
    node = Node.new(data)
    @size += 1
    unless @top
      @top = node
      return
    end

    node.next = @top
    @top = node
  end

  def pop
    return nil unless @top
    val = @top.data
    @top = @top.next
    @size -= 1
    val
  end
end

#Input: String containing '{','[','}',']'
def valid?(paran_str)
  stack = Stack.new
  hash = {'}' => '{', ']' => '['}
  for i in 0..paran_str.size-1
    case paran_str[i]
    when '{', '['
      stack.push(paran_str[i])
    else
      return false if (stack.pop != hash[paran_str[i]])
    end
  end
  stack.size == 0
end

puts valid?("{{{{}}}}")
puts valid?("{{{{[]}}}}")
puts valid?("{{{{[}]}}}")
puts valid?("[[]]]")
puts valid?("[[[]]")
