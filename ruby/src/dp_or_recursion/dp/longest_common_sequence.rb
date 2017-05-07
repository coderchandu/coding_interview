#Given 2 sequences, find longest common subsequence in it(sequence in increasing order)
#ABCDEFGH and PAPORODPPEEGH is ADEGH

#Solution
#================================================
#1Recursive approach

# if last char of a == last char of b lcs = 1 + lcs(a[0..size-1], b[0..size-1])
# else
#   lcs = max ( 
#
def lcs(a,b)
  return "" if a.size==0 || b.size==0

  if (a.size == 1 || b.size == 1)
    return (a[a.size-1] == b[b.size-1]) ? "#{a[a.size-1]}" : ""
  end
  #LCS with one char less and add 1 for the last char
  return "#{a[a.size-1]}" + lcs(a[0..a.size-2], b[0..b.size-2]) if a[a.size-1] == b[b.size-1]

  lcs_1 = lcs(a[0..a.size-2], b)
  lcs_2 = lcs(a, b[0..b.size-2])
  lcs_1.size > lcs_2.size ? lcs_1 : lcs_2
end

def longest_sequence(a,b)
  reverse(lcs(a,b))
end
def reverse(str)
  j = str.size-1
  return str if j <= 0
  for i in 0..((str.size-1)/2)
    tmp = str[i]
    str[i] = str[j]
    str[j] = tmp
    j -= 1
  end
  str
end
#=====================================

def lcs_dp(a,b)
  len1 = a.size
  len2 = b.size
  lcs_values = Array.new(a.size+1) { Array.new(b.size+1) }
  lcs_length = Array.new(a.size+1) { Array.new(b.size+1, 0) }
  for i in 0..a.size-1
    lcs_length[i][0] = 0
  end
  for j in 0..b.size-1
    lcs_length[0][j] = 0
  end
  for ind1 in 0..a.size-1
    for ind2 in 0..b.size-1
      i = ind1+1
      j = ind2+1
      if (a[i-1] == b[j-1])
        lcs_values[i][j] = :diagonal
        lcs_length[i][j] = 1 + (lcs_length[i-1][j-1])
      elsif (lcs_length[i][j-1] > lcs_length[i-1][j])
        lcs_values[i][j] = :left
        lcs_length[i][j] = lcs_length[i][j-1]
      else
        lcs_values[i][j] = :top
        lcs_length[i][j] = lcs_length[i-1][j]
      end
    end
  end

  sequence = ""
  i = a.size
  j = b.size
  len = 0
  while (i>0 && j>0)
    if (lcs_values[i][j] == :diagonal)
      sequence = a[i-1] + sequence
      len += 1
      i -= 1
      j -= 1
    elsif (lcs_values[i][j] == :left)
      j -= 1
    else
      i -= 1
    end
  end
  print "sequence length for #{a} and #{b} => ",  lcs_length[a.size][b.size], " "
  sequence
end

puts longest_sequence("ABCDEFGH","BEGHOP")
puts lcs_dp("ABCDEFGH","BEGHOP")
puts lcs_dp("ABCDEFGH","PABCFPABCDFGPPGH")
puts lcs_dp("AB","PAC")
puts lcs_dp("AB","AB")
puts lcs_dp("ABBAACYUIV","AAAUV")
