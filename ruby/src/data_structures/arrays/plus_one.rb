#Given a non-negative number represented as an array of digits

#add 1 to the number ( increment the number represented by the digits ).

#The digits are stored such that the most significant digit is at the head of the list

class Solution
    # param a : array of integers
    # return a array of integers
    def plusOne(a)
      carry = 0
      i = a.size-1
      sum_val = 1
      while (i>=0)
        sum = a[i] + sum_val + carry
        sum_val = 0
        carry = 0
        if sum >= 10
          sum = sum%10
          carry = 1
        end
        a[i] = sum
        i -= 1
      end
      a = [1] + a if (carry == 1)
      a=a[1..a.size-1] while a[0] == 0
      a
    end
end

puts "124=>", Solution.new.plusOne([1, 2, 3])
puts "124=>", Solution.new.plusOne([0, 0, 1, 2, 3])
puts "100=>",Solution.new.plusOne([9, 9])
puts "90=>", Solution.new.plusOne([8, 9])
