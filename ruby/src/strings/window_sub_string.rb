#Given a string and sub string, find the minimum sequence in which all chars in sub string is present
#in the given string

#Get counts of chars in sub string in a hash. Have 2 pointers, start 2nd pointer with the size of substring
#Find a substring between 2 pointers where all chars are present. Minimize the window by incrementing 1st pointer
class Solution

    def includes?(a, hash)
      for i in 0..a.size-1
        next unless hash.key?(a[i])
        hash[a[i]] -= 1
      end
      hash.values.each do |v|
        return false if v > 0
      end
      true
    end

    # param a : string
    # param b : string
    # return a strings
    def minWindow(a, b)
      reutrn "" if b.size > a.size
      i = 0
      j = b.size-1
      minStart = nil
      minWindowSize = a.size+1
      count_hash = {}
      for i in 0..b.size-1
        count_hash[b[i]] ||= 0
        count_hash[b[i]] += 1
      end
      i=0
      for j in b.size-1..a.size-1
        if (includes?(a[i..j],count_hash.dup))
           while (j>=i && (j-i+1) >= b.size)
             i += 1
             break unless includes?(a[i..j], count_hash.dup)
           end
           i -= 1
           windowSize = j-i+1
           if windowSize < minWindowSize
             minWindowSize = windowSize
             minStart = i
           end
           i += 1
        end
      end
      minStart ? a[minStart..minStart+minWindowSize-1] : ""
    end

   def window(a,b)
     return "" if b.size > a.size
     sub_count_hash = {}
     string_count_hash = {}
     for i in 0..b.size-1
       sub_count_hash[b[i]] ||= 0
       sub_count_hash[b[i]] += 1
       string_count_hash[a[i]] ||= 0
       string_count_hash[a[i]] += 1 if i!=b.size-1 #Because it is collected below
     end

     i=0
     minStart = nil
     minWindowSize = a.size+1
     for j in b.size-1..a.size-1
       if (sub_count_hash[a[j]])
         string_count_hash[a[j]] ||= 0
         string_count_hash[a[j]] += 1
       end
       if (includes?(a[i..j], sub_count_hash.dup))
         while (i<=j && (j-i+1) >= b.size)
           break if (sub_count_hash[a[i]] && string_count_hash[a[i]] && string_count_hash[a[i]] <= sub_count_hash[a[i]])
           string_count_hash[a[i]] -= 1 if string_count_hash[a[i]]
           i+=1
         end
         windowSize = j-i+1
         if windowSize < minWindowSize
           minWindowSize = windowSize
           minStart = i
         end
         string_count_hash[a[i]] -= 1
         i += 1
       end
     end
     minStart ? a[minStart..minStart+minWindowSize-1] : ""
   end
end

puts Solution.new.minWindow("ADOBECODEBANC", "ABC")
puts Solution.new.minWindow("ADOBECODEBANC", "EBNO")
puts Solution.new.minWindow("A", "A")

puts Solution.new.minWindow("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "A")
puts Solution.new.minWindow("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "AJ")
puts Solution.new.minWindow("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "WK")
puts Solution.new.minWindow("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "WKHADJS")
puts "compare ----"

puts Solution.new.window("ADOBECODEBANC", "ABC")
puts Solution.new.window("ADOBECODEBANC", "EBNO")
puts Solution.new.window("A", "A")
puts Solution.new.window("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "A")
puts Solution.new.window("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "AJ")
puts Solution.new.window("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "WK")
puts Solution.new.window("ABCDEHAWEFJSDFKJQWEQWEKJAD	QWEWQEQWEKABVSD", "WKHADJS")
