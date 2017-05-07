class Stack
  attr_accessor :top

  class Node
    attr_accessor :data, :next_node

    def initialize(data)
      self.data = data
      @next_node = nil
    end
  end

  def initialize()
    @top = nil  
  end

  def push(data)
    node = Node.new(data)
    node.next_node = @top
    @top = node
  end

  def pop()
    if @top.nil?
      return nil
    end

    value = @top.data
    @top = @top.next_node
    value
  end

  def peep()
    @top.data if @top
  end
end

class StackWithMin < Stack
  def initialize
    super
    @min_stack = Stack.new
  end

  def push(data)
    super
    @min_stack.push(data) if @min_stack.peep.nil? || @min_stack.peep() >= data
  end

  def pop()
    data = super
    @min_stack.pop if @min_stack && @min_stack.peep == data
    data
  end

  def min()
    @min_stack.peep
  end
end

def start()
s = StackWithMin.new
s.push(3)
puts "Min", s.min
puts s.pop
puts s.pop
puts "Min", s.min
s.push(5)
s.push(7)
puts "Min", s.min

puts s.pop
puts s.pop
puts s.pop
end
