class Stack
  attr_accessor :top, :size

  class Node
    attr_accessor :data, :next_node

    def initialize(data)
      self.data = data
      @next_node = nil
    end
  end

  def initialize()
    @top = nil
    @size = 0
  end

  def push(data)
    node = Node.new(data)
    node.next_node = @top
    @top = node
    @size += 1
  end

  def pop()
    return nil if @top.nil?

    value = @top.data
    @top = @top.next_node
    @size -= 1
    value
  end

  def peep()
    @top.data if @top
  end
end

class SetOfStack
  MAX_STACK_SIZE=3
  attr_reader :stacks

  def initialize
    @stacks = []
  end

  def top
    @stacks.last.top
  end

  def popAt(stackNum)
    return nil if @stacks.size < stackNum
    @stacks[stackNum-1].pop
  end

  def pop
    stack = @stacks.last
    data = stack.pop
    unless data
      puts "Deleting a stack"
      @stacks.pop 
      stack = @stacks.last
      data = stack.pop if stack
    end
    data
  end

  def push(data)
    stack = @stacks.last
    if stack.nil? || stack.size >= MAX_STACK_SIZE
      stack = Stack.new
      @stacks << stack
      puts "Creating new stack: #{@stacks.size}"
    end

    stack.push(data)
  end
end

s = SetOfStack.new
s.push(3)
puts s.pop
puts s.pop
s.push(5)
puts s.top.data
s.push(7)
puts s.top.data

s.push(9)
puts s.top.data
s.push(11)
puts s.top.data
s.push(13)
puts s.top.data
s.push(15)
puts "pop At 1 => #{s.popAt(1)}"
puts "pop At 2 => #{s.popAt(2)}"
puts "pop At 1 => #{s.popAt(1)}"
puts "pop At 1 => #{s.popAt(1)}"
puts "pop At 1 => #{s.popAt(1)}"
puts s.top.data
puts s.pop
puts s.pop
puts s.pop
