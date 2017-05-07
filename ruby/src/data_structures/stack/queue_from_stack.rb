#Implement queue using 2 stacks
#Use one stack to push, other one to pop. When pop stock is empty, pop from one and push to pop stack

class Stack
  attr_reader :top

  class Node
    attr_accessor :data, :next
    def initialize(data)
      @data = data
      @next = nil
    end
  end

  def push(data)
    node = Node.new(data)
    node.next = @top
    @top = node
  end

  def pop
    return nil unless @top
    data = @top.data
    @top = @top.next
    data
  end
end

class MyQueue
  attr_accessor :push_stack, :pop_stack

  def initialize
    @push_stack = Stack.new
    @pop_stack = Stack.new
  end

  def enqueue(data)
    @push_stack.push(data)
  end

  def dequeue
    return @pop_stack.pop if @pop_stack.top
    while((data = @push_stack.pop) != nil)
      @pop_stack.push(data)
    end
    @pop_stack.pop
  end
end

queue = MyQueue.new
queue.enqueue(34)
queue.enqueue(44)
queue.enqueue(54)
queue.enqueue(64)
puts queue.dequeue
puts queue.dequeue
queue.enqueue(55)
queue.enqueue(65)
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
