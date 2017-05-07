#Given a string, find the longest substring without repeating characters.
#For example, for string “abccdefgh”, the longest substring is “cdefgh”.

#2 pointers - when a duplicate is encountered, incr 1st pointer one by one till
# that dupe char is covered, and continue counting for longest sub string
def longest_sub_str(str)
  first = 0
  last = 0
  hash = {}
  longest_length = 0
  length = 0
  substr_start = 0

  while (last <= str.size-1)
    if hash.key?(str[last])
      while(str[first] != str[last])
        hash.delete(str[first])
        first += 1
        length -= 1
      end
      first += 1
    else
      hash[str[last]] = true
      length += 1
      if longest_length < length
        longest_length = length
        substr_start = first
      end
    end
    last += 1
  end

  print "#{str} =>", str[substr_start..substr_start+longest_length-1]
  puts
end

longest_sub_str("u")
longest_sub_str("abccdefgh")
longest_sub_str("abcadbef")
longest_sub_str("abac")
longest_sub_str("aaaaa")


longest_sub_str("abcdbal")

