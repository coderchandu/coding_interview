# Given an array of non-negative numbers, find continuous subarray with given sum
def sub_array_with_sum(arr, sum)
  #Since it is all positive, very easy to do sliding window technique with 2 pointers

  puts "Array: #{arr}, sum:#{sum}"
  left = 0
  right = 0
  sum_so_far = 0
  while (right < arr.size)
    sum_so_far += arr[right]
    if (sum == sum_so_far)
      return arr[left..right]
    elsif (sum_so_far < sum)
      right += 1
    else # sum_so_far > sum
      sum_so_far -= arr[left]
      left += 1
      right += 1 if left > right
    end
  end
  print "Not found"
  nil
end

print sub_array_with_sum([23,1,11,0], 1), "\n"
print sub_array_with_sum([23,1,11,0], 12), "\n"
print sub_array_with_sum([23,1,11,0], 0), "\n"
print sub_array_with_sum([23,1,11,0], 23), "\n"
print sub_array_with_sum([2,1,11,0], 3), "\n"
print sub_array_with_sum([2,1,11,0], 111), "\n"


# Given an array of numbers, find subarray with given sum
#Sub-array need not be contigous. So we've to consider all combinations
#Use DP - store sub array which has sum from i..n to sum_array[][]
def generic_sub_array_with_sum(arr, sum)
  sum_array = Array.new(arr.size+1) { Array.new(sum+1) } 
  sub_array(arr, 0, sum, sum_array)
end

def sub_array(arr, i, sum, sum_array)
  return sum_array[i][sum] if sum_array[i][sum] != nil

  #case 1: arr[i] is included as sub array which result in sum
  result = sub_array(arr, i+1, sum-arr[i], sum_array)
  if result != nil
    sum_array[i+1][sum-arr[i]] = result
    return result
  end

  #case 2: arr[i] is not included as sub array which result in sum
  result = sub_array(arr, i+1, sum, sum_array)
  if result != nil
    sum_array[i+1][sum] = result
    return result
  end
end

print generic_sub_array_with_sum([23,1,11,0], 1), "\n"
print generic_sub_array_with_sum([1,23,91,11,0], 12), "\n"
print generic_sub_array_with_sum([15,23,1,11,0], 27), "\n"
print generic_sub_array_with_sum([23,12,1,11,0], 34), "\n"
