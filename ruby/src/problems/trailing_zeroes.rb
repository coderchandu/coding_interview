#how many trailing zeroes in n!

#zeroes contributed by 2*5. Since number of 5s is less, find that
#to note: 25,75 etc. contribute to extra(25=5*5)

def number(n)
  if n<=0
    return 0
  end
  i=5
  count = 0
  while (n/i > 0)
    count += (n/i)
    i*=5
  end
  count 
end

#Let’s walk through an example to see how this works: Suppose num = 26. In the first loop, we count how many multiples of five there are by doing 26 / 5 = 5 (these multiples are 5, 10, 15, 20, and 25). In the next loop, we count how many multiples of 25 there are: 26 / 25 = 1 (this multiple is 25). Thus, we see that we get one zero from 5, 10, 15 and 20, and two zeros from 25 (note how it was counted twice in the loops). Therefore, 26! has six zeros.

puts number(100)
