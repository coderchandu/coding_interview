def sorted_array_intersection(arr1, arr2)
  i = 0
  j = 0
  intersections = []

  while (i<arr1.size && j<arr2.size)
    if (arr1[i] == arr2[j])
      intersections << arr1[i]
      i += 1
      j += 1
    elsif (arr1[i] < arr2[j])
      i += 1
    else
      j += 1
    end
  end
  intersections
end

def array_intersection(arr1, arr2)
  #Sort takes n log in. If that is ok, call sorted_array_intersection(arr1.sort, arr2.sort)
  h = {}
  intersections = []
  if (arr1.size < arr2.size) # To save some space in hash
    min = arr1
    max = arr2
  else
    min = arr2
    max = arr1
  end
  for i in 0..min.size-1
    h[min[i]] = true
  end
  for i in 0..max.size-1
    intersections << max[i] if (h.key?(max[i]))
  end
  intersections
end

puts sorted_array_intersection([2,4,5,6,19], [1,3,5,7,8,9,10,11,12,19])
puts "-----"
puts array_intersection([2,4,19,6,5], [1,3,2,8,9,10,11,12,19,5])
