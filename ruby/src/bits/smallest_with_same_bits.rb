#Given an integer, print the next smallest and next largest number that have the same
#number of 1 bits in their binary representation.

def get_number_of_1s(number)
  if number < 0
   sign = -1
   number = number * -1
  end
  count = 0
  while (number>0)
    number = (number & number-1)
    count += 1
  end
  count
end

puts "5 => ", get_number_of_1s(5)
 puts "8 => ", get_number_of_1s(8)
 puts "16 => ",get_number_of_1s(16)
 puts "10 => ",get_number_of_1s(10)
