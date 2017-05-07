#Print all anagrams of a string
# abcd - abcd, acbd, adbc, bacd, badc,bdac,cabd,cbad,cbda etc
#Take one char, find anagrams of substring without that char - add this char to all
#instances of that sub string anagrams
def anagrams(str)
  if (str.size <= 1)
    return [str]
  end
  anagram_values = []
  char_to_add = str[0].to_s
  anagrams(str[1..str.size-1]).each do |value|
    anagram_values << (char_to_add + value)
    for i in 0..value.size-1
      anagram_values << value[0..i] + char_to_add + value[i+1..value.size-1]
    end
  end
  anagram_values
end

def print_anagrams(str)
  puts "#{str} => #{anagrams(str)}"
end

print_anagrams("abcd")
print_anagrams("abc")
print_anagrams("ab")
print_anagrams("a")
print_anagrams("abcde")
