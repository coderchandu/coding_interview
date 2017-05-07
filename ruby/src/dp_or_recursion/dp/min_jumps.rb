#Given an array of integers where each element represents the max number of steps that can be made forward from that element. 
#Write a function to return the minimum number of jumps to reach the end of the array (starting from the first element). If an element is 0, then cannot move through that element.
#Input: arr[] = {1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9}
#Output: 3 (1-> 3 -> 8 ->9)

#Define array such that it represents jumps required from 0 till that point
def min_jumps(arr)
  steps_required_from_start = Array.new(arr.size, arr.size+1)
  steps = Array.new(arr.size, 0) #Store actual steps
  return -1 if arr[0] == 0

  steps_required_from_start[0] = 0
  i = 1
  while (i<=arr.size-1)
    for j in 0..i-1
      if (j+arr[j] >= i && steps_required_from_start[i] > steps_required_from_start[j]+1)
        steps_required_from_start[i] = steps_required_from_start[j] + 1
        steps[i] = j
      end
    end
    i+=1
  end
  i = arr.size-1
  while (i>0)
    print arr[i], " "
    i = steps[i]
  end
  print arr[0]
  puts 
  steps_required_from_start[arr.size-1]
end

puts min_jumps([1, 3, 5, 2, 0, 2, 6, 7, 6, 8, 9])
