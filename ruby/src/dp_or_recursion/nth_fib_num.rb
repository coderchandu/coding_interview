#0, 1, 1, 2, 3
def nthFibRecurse(n)
  return -1 if n<0
  return n if (n <= 1)
  nthFibRecurse(n-1) + nthFibRecurse(n-2)
end

def nthFib(n)
  return -1 if n < 0
  return n if (n <= 1)
  a = 0
  b = 1
  n = n-2
  while (n>=0)
    val = a + b
    a = b
    b = val
    n -= 1
  end
  b
end

puts "re=#{nthFibRecurse(20)}, va=#{nthFib(20)}"
