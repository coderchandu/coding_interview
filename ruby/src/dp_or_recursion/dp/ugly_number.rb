#Ugly numbers are numbers whose only prime factors are 2, 3 or 5. The sequence
#1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, …
#shows the first 11 ugly numbers. By convention, 1 is included.
#Write a program to find and print the 150’th ugly number.

#DP approach
#because every number can only be divided by 2, 3, 5, one way to look at the sequence is to split the sequence to three groups as below:
   #  (1) 1×2, 2×2, 3×2, 4×2, 5×2
   #  (2) 1×3, 2×3, 3×3, 4×3, 5×3
   #  (3) 1×5, 2×5, 3×5, 4×5, 5×5
#An ugly number must be multiplied by either 2, 3, or 5 from a smaller ugly number.
#Use logic similar to merge sort

def find_ugly_number(n)
  return -1 if n <= 0
  return 1 if n == 1

  
  i2 = 0
  i3 = 0
  i5 = 0
  next_ugly_number_index = 1
  ugly_numbers = [1]
  i = 1
  while (i<n)
    i2_value = (i2 < i) ? ugly_numbers[i2]*2 : 0
    i3_value = (i3 < i) ? ugly_numbers[i3]*3 : 0
    i5_value = (i5 < i) ? ugly_numbers[i5]*5 : 0
    next_ugly_number = [i2_value, i3_value, i5_value].min
    if (next_ugly_number == i2_value)
      i2 += 1
    elsif (next_ugly_number == i3_value)
      i3 += 1
    else
      i5 += 1
    end
    next if next_ugly_number == ugly_numbers[i-1]
    ugly_numbers[i] = next_ugly_number
    i += 1
  end
  ugly_numbers
end

puts find_ugly_number(10)
puts find_ugly_number(12)
puts find_ugly_number(150)
