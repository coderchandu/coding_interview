#Given an array of integers, sort the array into a wave like array and return it, 
#In other words, arrange the elements into a sequence such that a1 >= a2 <= a3 >= a4 <= a5.....

#Given [1, 2, 3, 4] => One possible answer : [2, 1, 4, 3]

class Solution
    # param a : array of integers
    # return a array of integers
    def wave(a)
      a.sort!
      i = 0
      while (i < a.size-1)
        swap(a, i, i+1)
        i += 2
      end
      a
    end

    def swap(a, i, j)
      temp = a[i]
      a[i] = a[j]
      a[j] = temp
    end
end

puts Solution.new.wave([ 5, 1, 3, 2, 4 ])

