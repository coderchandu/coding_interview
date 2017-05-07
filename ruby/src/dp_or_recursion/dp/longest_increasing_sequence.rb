#Find the length of the longest subsequence of a given sequence such that all elements of the subsequence are sorted in increasing order
#Length of LIS { 10, 22, 9, 33, 21, 50, 41, 60, 80 } is 6 and LIS is {10, 22, 33, 50, 60, 80}

#10,22,33,50,60,80
#10,11,21,22,50,60,80

#10,22,11 => {10,11}, {10,22}


def longest_incr_sequence_length(arr)
  return 0 if arr.size == 0
  return 1 if arr.size == 1

  print "array = #{arr}\n"
  lis_length_so_far = Array.new(arr.size)
  lis_length_so_far[0] = 1
  value_indexes = Array.new(arr.size)
  for i in 1..arr.size-1
    max_len = 1
    for j in 0..i-1
      index = nil
      if (arr[i] > arr[j])
        index = j
        length = lis_length_so_far[j] + 1 #Length incl this element
      else
        length = lis_length_so_far[j] #Length excl this element
      end
      if (length > max_len)
        max_len = length
        max_len_index = index if index
      end
    end
    lis_length_so_far[i] = max_len
    value_indexes[i] = max_len_index
  end
  i=value_indexes.size-1
  i -= 1 while (i>=0 && value_indexes[i].nil?)
  while(i>=0)
    print arr[i], " "
    if value_indexes[i]
      i = value_indexes[i]
    else
      break
    end
  end
  puts
  lis_length_so_far.max
end

puts longest_incr_sequence_length([50, 20, 9, 53, 21, 50, 41, 60, 80])
puts longest_incr_sequence_length([10, 22, 11, 33, 21, 22, 50, 41, 60, 80])
puts longest_incr_sequence_length([10, 22, 9, 33, 21, 50, 41, 60, 80])
