#Root of heap is a[1]

#Max heap : Parent node value is always greater than the node value #Largest at root
#Min heap : Parent node value is always less than the node value #Smallest at root
class Heap
  attr_accessor :arr, :size, :max_heap

  def initialize(arr=[], max_heap=true)
    @arr = [nil] + arr
    @size = arr.size
    @max_heap = max_heap
    build_heap(max_heap) if @size > 1
  end

  def replace_root_and_heapfiy(num)
    @arr[1] = num
    heapify 
  end

  def lookup(num)
  end

  def adjust_heap
  end

  def peek
    @arr[1]
  end

  #Element at root index is not part of heap, but left and right are already
  #in heap. We just have to place element in root_index to proper place in the
  #heap
  def max_heapify(root_index=1)
    #Find biggest element of root, left and right to be the new root
    largest = root_index
    left = left_child(root_index)
    if left<=@size && @arr[left] > @arr[root_index]
      largest = left
    end
    right = right_child(root_index)
    if right<=@size && @arr[right] > @arr[largest]
      largest = right
    end
    if (largest != root_index)
      swap(largest, root_index)
      max_heapify(largest)
    end
  end

  def min_heapify(root_index=1)
    #Find smallest element of root, left and right to be the new root
    left = left_child(root_index)
    smallest = root_index
    if left<=@size && @arr[left] < @arr[root_index]
      smallest = left
    end

    right = right_child(root_index)
    if right<=@size && @arr[right] < @arr[smallest]
      smallest = right
    end
    if (smallest != root_index)
      swap(smallest, root_index)
      min_heapify(smallest)
    end
  end

  def heapify
    @max_heap ? max_heapify : min_heapify
  end

  def build_heap(max_heap)
    #All leaf level nodes are single element heaps. Bottom up starting from non leaf level
    #For binary tree with n nodes n/2+1..n are all leaf nodes
    i = @size/2
    while (i>=1)
      max_heap ? max_heapify(i) : min_heapify(i)
      i -= 1
    end
  end

  def sort
    i=@size
    while (i>1)
      swap(1,i)
      @size -= 1
      max_heapify(1)
      i -= 1
    end
    @size = @arr.size
  end

  def parent(index)
    index/2
  end
 
  private

  def swap(a,b)
    tmp = @arr[a]
    @arr[a] = @arr[b]
    @arr[b] = tmp
  end

  def left_child(index)
    index*2
  end
 
  def right_child(index)
    2*index + 1
  end
end

heap = Heap.new([43,35,56,7,12,23,11])

#puts heap.arr[1..heap.size]
#heap.sort
#puts "------- #{heap.arr[1..heap.size]}"
