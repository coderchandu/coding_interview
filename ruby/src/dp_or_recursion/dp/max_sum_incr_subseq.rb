#Given an array of n positive integers. Write a program to find the sum of maximum sum subsequence of the given array such that the intgers
# in the subsequence are sorted in increasing order. For example, if input is {1, 101, 2, 3, 100, 4, 5}, then output should be 106
# (1 + 2 + 3 + 100), if the input array is {3, 4, 5, 10}, then output should be 22 (3 + 4 + 5 + 10) and if the input array is {10, 5, 4, 3}, then output should be 10

#Follow up: print the subsequence

def max_sum_subsequence(arr)
  max_sum = Array.new(arr.size) #Array value which ends at current value - where each sum gives the value of longest sequence incl that value
  max_index = Array.new(arr.size) 
  max_sum[0] = arr[0]
  for i in 1..arr.size-1
    max_val = arr[i]
    for j in 0..i-1
      if (arr[i] > arr[j] && max_sum[j] + arr[i] > max_val)
        max_val = max_sum[j] + arr[i]
        max_index[i] = j
      end
    end
    max_sum[i] = max_val
  end
  index = max_sum.find_index(max_sum.max)
  while (index && index >= 0)
    print arr[index], " "
    index = max_index[index]
  end
  max_sum.max #Since it is max till that point if it is part of long sequence
end

puts "106 => #{max_sum_subsequence([1, 101, 2, 3, 100, 4, 5])}"
puts "22 => #{max_sum_subsequence([3, 4, 5, 10])}"
puts "10 => #{max_sum_subsequence([10, 5, 4, 3])}"
