class Sorting
  attr_reader :array

  def initialize(array)
    @array = array || []
  end

  def print
    @array.each { |arr| puts arr }
  end

  def bubble_sort
    for i in 0..@array.size-1
      for j in 0..@array.size-2-i
        if @array[j] > @array[j+1]
          swap(@array, j, j+1)
        end
      end
    end
    print
  end
  
  # Select smallest in each iteration and move it to the beginning of sorted list
  def selection_sort
    for i in 0..@array.size-1
      min_index = i
      for j in i+1..@array.size-1
        min_index = j if (@array[j] < @array[min_index])
      end
      swap(@array, i, min_index)
    end
    print
  end

  def merge_sort
    return if @array == []
    do_merge_sort(0, @array.size-1)
  end

  def quick_sort
    perform_quick_sort(0, @array.size-1)
  end

  #Insert each element in sorted order start from 2nd element
  def insertion_sort(arr=@array)
    result = arr
    for i in 1..result.size - 1
      key = result[i]
      index = i
      while (index > 0 && result[index-1] > key)
        result[index] = result[index-1]
        index -= 1
      end
      result[index] = key
    end
    result
  end

  # Create buckets in sorted order, add data to buckets,
  # Sort each buckets using insertion sort
  # Get values from all buckets in sorting order of bucket slot
  def bucket_sort
    buckets = {}
    #Ideal for known and uniformly distributed range. Sort age of employees for eg.:
    @array.each do |age|
      bucket = age/10
      buckets[bucket] ||= []
      buckets[bucket] << age
    end

    result = []
    for i in 0..20
      arr = buckets[i]
      puts "i=#{i}, buckets[i]=#{arr}"
      puts "result=#{result}, sorted value=#{insertion_sort(arr)}" if arr
      result << insertion_sort(arr) if arr && arr != []
    end
    @array = result.flatten
  end

  def quick_sort_algo(low=0, high=@array.size-1)
    return if low>high
    p = partition(low, high)
    quick_sort_algo(low, p-1)
    quick_sort_algo(p+1, high)
  end
  
  private

  def swap(arr, i, j)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  end

  #Compare 1 to next and bubble up the largest to end in each iteration
  ############## QUICK SORT ####################
  #O(n logn) with worst case o(n^2) - Partition the array using a pivot such that all elements left are less and to the right
  #are greater than the pivotal value. After this operation, pivot is in right position. Then divide and do the same in each halves 
  def perform_quick_sort(low, high)
    return if low >= high
    pivot = @array[rand(low..high)]
    i = low
    j = high
    while (i<=j)
      i += 1 while i<=j && @array[i] < pivot
      j -= 1 while i<=j && @array[j] > pivot
      break if i>j
      swap(@array, i, j)
      i += 1
      j -= 1
    end
    perform_quick_sort(low, j) if low < j
    perform_quick_sort(i, high) if i < high
  end


  def partition(low, high)
    pivot = @array[high]
    i = low - 1
    for j in low..high-1
      if @array[j] <= pivot
        i += 1
        swap(@array, i, j)
      end 
    end
    swap(@array, i+1, high)
    i+1
  end

  ############## QUICK SORT END ################
  

  ############## MERGE SORT ####################
  #Sort each pair, then sort every four elements by merging two pairs. Then sort eight elements and so on
  #O(n log n) worst case. Start by dividing array into two until one element is left
  #Need new array
  def do_merge_sort(first, last)
    return if first >= last
 
    mid = (first + last)/2
    do_merge_sort(first, mid)
    do_merge_sort(mid+1, last)
    do_simple_merge(first,mid,last)
  end

  def do_simple_merge(first, mid, last)
    sorted_array = []
    i = first
    j = mid+1
    while (i<=mid && j<=last)
      if (@array[i] < @array[j])
        sorted_array << @array[i]
        i += 1
      else
        sorted_array << @array[j]
        j += 1
      end
    end
    while (i<=mid)
      sorted_array << @array[i]
      i += 1
    end
    while (j<=last)
      sorted_array << @array[j]
      j += 1
    end
    for i in 0..sorted_array.size-1
      @array[i+first] = sorted_array[i]
    end
  end


  def perform_merge_sort(arr, first, last)
    return [arr[first]] if first >= last
    mid = (first + last)/2
    array_1 = perform_merge_sort(arr, first, mid)
    array_2 = perform_merge_sort(arr, mid+1, last)
    simple_merge(array_1, array_2)
  end

  def simple_merge(array_1, array_2)
    sorted_array = []
    i=0
    j=0
    while (i < (array_1.size) && j < (array_2.size))
      if (array_1[i] < array_2[j])
        sorted_array << array_1[i]
        i+=1
      else
        sorted_array << array_2[j]
        j+=1
      end
    end

    while (i< (array_1.size))
      sorted_array << array_1[i]
      i += 1
    end
    while (j<(array_2.size))
      sorted_array << array_2[j]
      j += 1
    end
    sorted_array
  end
  ############# MERGE SORT END ##################
end

# puts "----Merge Sort-----"
# arr1=[45,123,-1,12231,0]
# arr2=[45,123,-1,12231,0,123]
# arr3=[45,45,45,45,0]
# puts "try: #{arr1}"
# Sorting.new(arr1).merge_sort
# puts "try: #{arr2}"
# Sorting.new(arr2).merge_sort
# puts "try: #{arr3}"
# Sorting.new(arr3).merge_sort
#  
# puts "----Merge Sort-----"
#  
# puts "Quick sort_-----"
# arr1=[45,123,-1,12231,0]
# arr2=[45,123,-1,12231,0,123]
# puts "try: #{arr1}"
# Sorting.new(arr1).quick_sort
# puts "try: #{arr2}"
# Sorting.new(arr2).quick_sort
# puts "try: #{arr3}"
# Sorting.new(arr3).quick_sort

def sorted?(arr)
  sorted = true
  for i in 1..arr.size-1
    if arr[i] < arr[i-1]
      sorted = false
      puts "Bad data found i=#{i}, #{arr[i-1]}, #{arr[i]}"
      break
    end
  end
  sorted
end

arr_rand=[]
10000.times do |i|
  arr_rand[i] = rand(5000)
end

puts "Quick sort ------"
time = Time.now
s = Sorting.new(arr_rand.dup)
s.quick_sort_algo
arr = s.array
puts "error => " if arr_rand.sort != arr
for i in 1..arr.size-1
  if arr[i] < arr[i-1]
    puts "Bad data found #{arr[i-1]}, #{arr[i]}"
    break
  end
end
puts "-------#{Time.now - time}"

puts "Merge sort"
time = Time.now
s = Sorting.new(arr_rand.dup)
s.merge_sort
arr = s.array
for i in 1..arr.size-1
  if arr[i] < arr[i-1]
    puts "Bad data found #{arr[i-1]}, #{arr[i]}"
    break
  end
end
puts "error => " if arr_rand.sort != arr
puts "---------#{Time.now - time}"

puts "Insertion"
s = Sorting.new([3434,-1,0,33,23,-1,0,22,341,11,2])
s.insertion_sort
s.print
puts "sorted= ",sorted?(s.array)
puts "Insertion sort done"

puts "Bucket sort"
s = Sorting.new([123, 1,23,44,12,13,2,123,25,5])
s.bucket_sort
s.print
puts "sorted= ",sorted?(s.array)
puts "Bucket sort done"
