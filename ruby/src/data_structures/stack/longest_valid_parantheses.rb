#For "(()", the longest valid parentheses substring is "()", which has length = 2.
#Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
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
def longest_valid_parans(paran_str)
  stack = Stack.new
  start = 0
  valid_len = max_len = 0
  for i in 0..paran_str.size-1
    case paran_str[i]
    when '('
      stack.push(paran_str[i])
    else
      if (stack.pop == '(')
        valid_len += 2
        if valid_len > max_len
          max_len = valid_len
        end
      else
        valid_len = 0
      end
    end
  end
  max_len 
end

puts longest_valid_parans("(()")
puts longest_valid_parans(")()())")
