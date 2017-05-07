#HCF - Highest/Greatest common factor(GCF)

def prime_numbers_till(num)
  #Approach 1
  primes = [2]
  for i in 3..num
    prime = true
    for j in 2..i/2
      if (i%j == 0)
        prime=false
        break
      end
    end
    primes << i if prime
  end

  #Approach 2 - Sieve of Eratosthenes
  #Initialize array of size num. Start with 2, mark its multiple. start with next non-marked and so on
  primes1 = [true] * num
  for i in 2..num
    if primes1[i]
      #Start marking its multiple as false
      j=i+i
      while (j<=num)
        primes1[j] = false
        j += i
      end
    end
  end

  arr = []
  for i in 2..primes1.size-1 do
    arr << i if primes1[i]
  end
  arr
end

def prime_factors(num)
  arr = []
  prime_numbers_till(num).each do |val|
    arr << val if num%val == 0
  end
  arr
end

def hcf(m, n)
  prime_factors(m) & prime_factors(n)
end

puts "Prime till 50 = #{prime_numbers_till(50)}"
puts "Prime factors of 20 = #{prime_factors(20)}"
puts "HCF of 20,15 = #{hcf(20,15)}"
