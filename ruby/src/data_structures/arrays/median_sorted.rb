#Find median of 2 sorted arrays

#If array has odd number, middle element of sorted array is median
#If array has even number, average of 2 middle element is the median

def median_index(arr_size)
  (arr_size-1)/2
end

def median_of_one_array(arr)
  index = median_index(arr.size)
  if arr.size % 2 == 0
    (arr[index] + arr[index+1])/2
  else
    arr[index]
  end
end

def median(arr1, arr2)
  if arr1.size == 0
    return median_of_one_array(arr2)
  elsif arr2.size == 0
    return median_of_one_array(arr1)
  end
  total_size = arr1.size + arr2.size
  median_pos = median_index(total_size)

  #Find element at index position in the sorted array of arr1 + arr2
  i = 0
  j = 0
  index = 0
  is_even = (total_size %2 == 0) ? true : false
  median_array = []
  m1 = 0
  while (i < arr1.size && j < arr2.size)
    if (arr1[i] < arr2[j])
      if (is_even && index == median_pos+1)
        return (m1 + arr1[i])/2
      elsif (!is_even && index == median_pos)
        return arr1[i]
      end
      m1 = arr1[i] 
      i+=1
    else
      if (is_even && index == median_pos+1)
        return (m1 + arr2[j])/2
      elsif (!is_even && index == median_pos)
        return arr2[j]
      end
      m1 = arr2[j]
      j+=1
    end
    index += 1
  end
  while (i<arr1.size)
    if index==median_pos
      return is_even ? (arr1[i] + arr1[i+1])/2 : arr1[i]
    end
    i+=1
    index += 1
  end
  while (j<arr2.size)
    if index==median_pos
      return is_even ? (arr2[j] + arr2[j+1])/2 : arr2[j]
    end
    j+=1
    index += 1
  end
end

puts "3 and empty => 3"
puts median([3], [])
puts "3,4 and 5 => 4"
puts median([3,4], [5])
puts "3,14,25 and 16,23,24 => 19"
puts median([3,14,25], [16,23,24])
puts "3,4,5,6 and 9,10,11 => 6"
puts median([3,4,5,6], [9,10,11])
puts "3,4,5,6,20 and 10,11,12 => 8"
puts median([3,4,5,6,20], [10,11,12])
puts "3,4,5,6,7 and 9,10,11,12 => 7"
puts median([3,4,5,6,7], [9,10,11,12])
