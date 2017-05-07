#Given arr, find triplet indices in array such that i<j<k and arr[i]<arr[j]<arr[k]

# You've to find 3 elements which are in ascending order in the array
# Fix middle element j - see if there is a smaller element in left and larger element in right

def find_triplet(arr)
  return nil if arr.size <= 2

  min_index = 0
  max_index = arr.size-1
  max_arr = []
  k = arr.size-2
  while (k>0)
    max_arr[k] = max_index
    max_index = k if arr[k] > arr[max_index]
    k -= 1
  end

  k = arr.size-1
  for j in 1..arr.size-2
    if (arr[min_index] < arr[j] && arr[j] < arr[max_arr[j]])
      return [min_index, j, max_arr[j]]
    end
    min_index = j if arr[j] < arr[min_index]
  end
  nil
end

puts find_triplet([31,11,15,12,44])
