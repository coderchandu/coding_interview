require './heap.rb'
class PriorityQueue < Heap
  def enqueue(data)
    @arr << data
    @size = @arr.size-1
    key = @size
    while (key > 1 && @arr[key] > @arr[parent(key)])
      p = parent(key)
      swap(key,p)
      key = p
    end
    @arr[key] = data
  end

  #Head of queue - Max value for max heap and min value for min heap
  def peek()
    @arr[1]
  end
  
  def dequeue()
    if @size < 1
      puts "Queue underflow"
      return nil
    end
    element = @arr[1]
    @arr[1] = @arr[@size]
    @size -= 1
    max_heapify(1)
    element
  end

  def print_values
    puts @arr[1..@size]
  end
end

queue = PriorityQueue.new([45,2,123,4,3,44,1])
puts queue.peek, queue.size
puts "deleting"
puts queue.dequeue, queue.size
puts queue.peek, queue.size
puts "Enqueue 0"
puts queue.enqueue(0), queue.size
puts queue.print_values
puts "Enqueue 46"
puts queue.enqueue(46), queue.size
puts "-----"
puts queue.print_values
puts queue.peek
