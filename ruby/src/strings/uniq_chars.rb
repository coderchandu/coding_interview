#Implement an algorithm to determine if a string has all unique characters
# Criteria - No additional space

def unique_chars_with_extra_space?(str)
  hash = {}
  for i in 0..str.size-1
    if hash.key?(str[i])
      puts "dup => #{str[i]}"
      return false
    end
    hash[str[i]] = true
  end
  true
end

def unique_chars?(str)
  for i in 0..str.size-1
    for j in i+1..str.size-1
      puts "dup => #{str[i]}" if str[i] == str[j]
      return false if str[i] == str[j]
    end
  end
  true
end

def remove_duplicates(str)
  return nil unless str
  hash = {}
  hash[str[0]] = true
  j = 0
  for i in 1..str.size-1
    next if hash.key?(str[i])
    hash[str[i]] = true
    j += 1
    str[j] = str[i]
  end
  str[0..j]
end

str="werakqa"
puts unique_chars_with_extra_space?(str)
puts unique_chars_with_extra_space?("2148905")
puts "----"
puts unique_chars?(str)
puts unique_chars?("2148905")
puts "Remove dupes"
puts remove_duplicates(str)
puts remove_duplicates("abcd")
puts remove_duplicates("aaaaa")
puts remove_duplicates(nil)
puts remove_duplicates("aaabbb")
puts remove_duplicates("abababa")
