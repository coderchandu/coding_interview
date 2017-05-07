#Given a palindrome string, find all combinations of size K which are also palindromes
# PAAPAAP is a palindrome. For size 3, APA is a palindrome
def findPalindromes(string, k)
  if (string.size < k || k <= 0)
    return []
  end
  if (string.size == k)
    return [string]
  end
  palindromes = []
  str = string[0..k-1]
  palindromes << str if isPalindrome(str)

  for j in k..string.size-1
      tmp[i] = string[j]
      palindromes << tmp if !palindromes.include?(tmp) && isPalindrome(tmp)
    end
  end
  palindromes
end

def isPalindrome(str)
  j = 0
  puts str
  for i in 0..str.size-1/2
    if (str[i] != str[j])
      return false
    end
  end
  puts "returning true"
  return true
end

puts findPalindromes("PAAPAAP", 3)
