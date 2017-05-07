#Given a rod of length n inches and an array of prices that contains prices of all pieces of size smaller than n. Determine the maximum value 
#obtainable by cutting up the rod and selling the pieces. For example, if length of the rod is 8 and the values of different pieces are given 
#as following, then the maximum obtainable value is 22 (by cutting in two pieces of lengths 2 and 6)

#length   | 1   2   3   4   5   6   7   8  
#--------------------------------------------
#price    | 1   5   8   9  10  17  17  20

#And if the prices are as following, then the maximum obtainable value is 24 (by cutting in eight pieces of length 1)

#length   | 1   2   3   4   5   6   7   8  
#--------------------------------------------
#price    | 3   5   8   9  10  17  17  20


#Approach 1: recursion

#Approach 2 : Bottom up dp. Save the solutions as we get something
#Idea: For each length, there is a choice - either cut it, or don't cut it
#If you cut it at length l, compare value so far with remaining rope(size-1-i)
def max_price_recursion(values, size=values.size)
  return 0 if values.nil? || values == []
  max_val = 0
  for i in 0..size-1
    max_val = [max_val, values[i] + max_price_recursion(values, size-1-i)].max
  end
  max_val
end

def max_price(values)
  return 0 if values.nil? || values == []
  max_values = Array.new(values.size+1)
  max_values[0] = 0
  max_so_far = 0
  for i in 1..values.size
    for j in 0..i-1
      max_so_far = [max_so_far, values[j] + max_values[i-1-j]].max
    end
    max_values[i] = max_so_far
  end
  max_values[values.size]
end

puts max_price([1,5,8])
puts max_price([1,5,8,9,10,17,17,20])
puts max_price([3,5,8,9,10,17,17,20])
