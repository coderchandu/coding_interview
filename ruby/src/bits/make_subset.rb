#You are given two 32-bit numbers, N and M, and two bit positions, i and j. Write a method to set all bits between i and j
# in N equal to M (e.g., M becomes a substring of N located at i and starting at j).
#Input: N = 10000000000, M = 10101, i = 2, j = 6
#Output: N = 10001010100

def set_bits(n, m, i, j)
  #Reset N's bits to zero from i to j(backwards starting with 0)
  #Set M's bit to N starting from j

  max = ~0
  #1's till position j, then zeroes
  left_bits = max - ((1<<j)-1)
  right_bits = ((1<<i)-1)
  mask = left_bits | right_bits
  (n & mask) | (m << i)
end

puts set_bits(1024, 21, 2, 6)
