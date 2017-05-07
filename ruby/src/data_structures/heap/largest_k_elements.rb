require './heap.rb'

#Given a big set of n numbers, find k largest elements
class LargestKElements
  attr_accessor :elements

  def initialize(arr)
    @elements = arr
  end
 
  #Use min heap of size k which has minimum at root.
  def find_k_largest_elements(k)
    n = @elements.size
    return -1 if k > n
    return @elements if k == n
    minHeap = Heap.new(@elements[0..k-1], false)
    for i in k..@elements.size-1
      if minHeap.peek < @elements[i]
        minHeap.replace_root_and_heapfiy(@elements[i])
      end
    end
    minHeap.arr
  end
end

puts LargestKElements.new([234,123,123,41,123,234,1,23,0,12,213,324,1,12,-123,12,1024,1,434,123,1,2,3,1000]).find_k_largest_elements(5)
puts LargestKElements.new([234,123,123,41,123,234,1,23,0,12,213,324,1,12,-123,12,1024,1,434,123,1,2,3,1000]).find_k_largest_elements(10)
puts LargestKElements.new([234,123,123,41,123,234,1,23,0,12,213,324,1,12,-123,12,1024,1,434,123,1,2,3,1000]).find_k_largest_elements(2)
