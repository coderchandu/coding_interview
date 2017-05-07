class Queue
  attr_accessor :front, :back

  class Node
    attr_accessor :data, :next_node

    def initialize(data)
      self.data = data
      @next_node = nil
    end
  end

  def initialize()
    @front = nil
    @back = nil  
  end

  def empty?
    @back.nil?
  end

  def enqueue(data)
    node = Node.new(data)
    if @back.nil?
      @back = @front = node
    else
      @back.next_node = node
      @back = node
    end
  end

  def dequeue()
    return nil if @back.nil?

    value = @front.data
    @front = @front.next_node
    @back = nil if @front == nil
    value
  end
end

def a
s = Queue.new
s.enqueue(3)
puts s.dequeue
puts s.dequeue
s.enqueue(5)
s.enqueue(7)

puts s.dequeue
puts s.dequeue
puts s.dequeue
end
