#Implement min in O(1) in a stack

class Stack
  attr_accessor :top, :min_top

  class Node
    attr_accessor :next, :data
    
    def initialize(data)
      @data = data
      @next = nil
    end
  end

  def initialize
    @top = nil
    @min_top = nil
  end

  def addToTop(data, top)
    node = Node.new(data)
    node.next = top
    node
  end

  def push(data)
    node = addToTop(data, @top)
    @top = node
    unless @min_top
      @min_top = @top
      return
    end
    @min_top = addToTop(data, @min_top) if data <= @min_top.data
  end

  def pop
    return nil unless @top
    data = @top.data
    @top = @top.next
    @min_top = @min_top.next if @min_top.data == data
    data
  end

  def min
    @min_top.data if @min_top 
  end
end

stack = Stack.new
stack.push(5)
puts stack.min
stack.push(10)
puts stack.min
stack.push(5)
stack.push(4)
puts stack.min
stack.push(1)
puts stack.min
stack.push(1)
puts stack.min
stack.pop
puts stack.min
stack.pop
puts stack.min
stack.pop
puts stack.min
