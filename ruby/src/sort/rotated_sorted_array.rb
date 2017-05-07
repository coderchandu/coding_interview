#A sorted array has been rotated so that the elements might appear in the order 3 4
#5 6 7 1 2. How would you find the minimum element?

#Solution:
# Make use of binary search idea. Finding the rotated point will find the minimum element
# 
module RotatedSortedArray
def self.find_min(arr)
  search(arr, 0, arr.length-1)
end

def self.search(arr, start, last)
  return arr[start] if start >= last
  mid = (start + last)/2
  return arr[mid] if mid>0 && arr[mid] < arr[mid-1]
  return arr[mid+1] if mid<arr.size && arr[mid+1] < arr[mid]
  if arr[start] > arr[mid]
    search(arr, start, mid - 1)
  elsif arr[mid] > arr[last]
    search(arr, mid + 1, last)
  else
    return arr[0]
  end
end
end

puts "1,2 => #{RotatedSortedArray.find_min([1,2])}"
puts "2,1 => #{RotatedSortedArray.find_min([2,1])}"
puts "[4,5,6,1,2,3] => #{RotatedSortedArray.find_min([4,5,6,1,2,3])}"
