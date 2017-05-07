#Given an unsorted integer array, find the first missing positive integer.
#Given [1,2,0] return 3
#[3,4,-1,1] return 2
#[-8, -7, -6] returns 1
#Your algorithm should run in O(n) time and use constant space.
class Solution
    # param a : array of integers
    #return an integer

    #Store each numbers by considering that as index. Exclude negative numbers, numbers greater than
    #array size since 1st missing positive must be within the size of array(if all numbers are present from 0..n-1)
    def firstMissingPositive(a)
      i = 0
      while i <= a.size-1
        if a[i] == i+1 || a[i] <= 0 || a[i] >= a.size
            i += 1
            next
        end
        
        new_index = a[i] - 1
        if (a[new_index] != a[i] && a[i] != i+1)
          tmp = a[new_index]
          a[new_index] = a[i]
          a[i] = tmp
        else
          i += 1
        end
      end
      for i in 0..a.size-1
        return i+1 if a[i] != i+1
      end
      return a.size+1
    end
end
puts "Exp 1", Solution.new().firstMissingPositive([-5])
puts "Exp 3", Solution.new().firstMissingPositive([2,2,1])
puts "Exp 1", Solution.new().firstMissingPositive([3,4,-1,-1])
puts "Exp 1", Solution.new().firstMissingPositive([-8, -7, -6])
