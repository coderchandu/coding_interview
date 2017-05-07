#You are given an array of integers (both positive and negative). Find the continuous sequence with the largest sum. Return the sum.
#EXAMPLE
#Input: {2, -8, 3, -2, 4, -10}
#Output: 5 (i.e., {3, -2, 4} )

#Sliding window - if sum drops less than 0, drop it as it will not contribute to max
def get_sum(arr)
  max_sum = arr[0]
  sum = arr[0]
  start = max_start = 0
  for i in 1..arr.size-1
    sum += arr[i]
    if sum > max_sum
      max_sum = sum
      max_start = start
    elsif sum < 0
      start=i+1
      sum=0
    end
  end
  return max_sum, max_start
end

puts get_sum([2, -8, 3, -2, 4, -10])
puts get_sum([-2, -8, -3, -2, -4, -1])
