#Given a rope of length n meters, cut the rope in different parts of integer lengths in a way that maximizes product 
#of lengths of all parts. You must make at least one cut. Assume that the length of rope is more than 2 meters. 

#Input: n = 2
#Output: 1 (Maximum obtainable product is 1*1)

#Input: n = 3
#Output: 2 (Maximum obtainable product is 1*2)
#
#Input: n = 4
#Output: 4 (Maximum obtainable product is 2*2)
#
#Input: n = 5
#Output: 6 (Maximum obtainable product is 2*3)
#
#Input: n = 10
#Output: 36 (Maximum obtainable product is 3*3*4)

# for n=2, 1*1
# for n=3, 1*1*1, 1*2
# for n=4, 1*1*1*1, 1*1*2,1*3,2*2
# for n=5, 1*1*1*1*1, 1*1*1*2,1*1*3,1*4,2*3
def maxProduct1(n)
  max_so_far = 1
  return 1 if (n <= 1)
  #Cut at each length and find max with that cut and for remaining rod -- i * prod(n-i)
  for i in 1..n-1
    max_so_far = [max_so_far, ((n-i) == 2) ? i*2 : i * maxProduct1(n-i)].max #i*2 is added to satisfy condition that at least one cut must be made.Otherwise recursion will return 1 as one cut must be made
  end
  max_so_far
end

puts "-----------------"
puts "max(2)=1 => #{maxProduct1(2)}"
puts "max(3)=2 => #{maxProduct1(3)}"
puts "max(4)=4 => #{maxProduct1(4)}"
puts "max(5)=6 => #{maxProduct1(5)}"
puts "max(10)=36 => #{maxProduct1(10)}"
puts "max(20)=36 => #{maxProduct1(20)}"
puts "-----------------"

def maxProduct(n)
  max_so_far = 1
  return 0 if (n <= 1)
  return 1 if (n == 2)
  max_values = Array.new(n+1)
  max_values[1] = 0
  max_values[0] = 0
  
  for i in 1..n
    for j in 1..i
      max_so_far = [max_so_far, (i-j == 2) ? j*2 : j * max_values[i-j]].max
    end
    max_values[i] = max_so_far
  end
  max_values[n]
end

puts "-----------------"
puts "max(2)=1 => #{maxProduct(2)}"
puts "max(3)=2 => #{maxProduct(3)}"
puts "max(4)=4 => #{maxProduct(4)}"
puts "max(5)=6 => #{maxProduct(5)}"
puts "max(10)=36 => #{maxProduct(10)}"
puts "max(20)=36 => #{maxProduct(20)}"
puts "max(40)=36 => #{maxProduct(40)}"
