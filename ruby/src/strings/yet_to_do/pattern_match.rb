#find pattern existence in substring
#1. Return true if exist ( in the same order)
#2. Find longest substring with the pattern
#3. Find smallest substring with the pattern

#pattern="abc", string="aaabcasdfsfd" => longest is aaabc. Shortest is abc

def patternExist?(str, pattern)
  j = 0
  for i in 0..str.size-1
    if (str[i] == pattern[j])
      j+=1
      if (j >= pattern.size)
        return true
      end
    end
  end
  return false
end

def longestPattern(str, pattern)
  j = 0
  i = 0
  present = false
  start_val = 0
  end_val = 0
  while (i<str.size)
    if (str[i] == pattern[j])
      start_index = i if (j==0) #Mark 1st char of pattern
      j += 1
      if (j >= pattern.size)
        present = true
        end_val = i
        break
      end
    end
    i+=1
  end

  return nil unless present

  i = str.size-1
  #Start from reverse to find the 1st occurrence of last char in pattern to find the longest sequence
  while (i>end_val)
    if (str[i] == pattern[pattern.size-1])
      end_val = i
      break
    end
    i -= 1
  end
  return str[start_val..end_val]
end

def smallestPattern(str, pattern)
  # To find smallest, we can store pattern char as the key and all its index presence in str as values for each char in pattern
  # a => [0,1,5,6], b=>[3,5], c=>[6,2]
  # Then traversing the pattern one by one, see if next char in pattern has an index greater than current index of the pattern. Repeat it for all
  # Once we find all such possiblities, smallest will be the with the sequence having min diff between 1st and last char 
  
  #hash = construct_hash(str)
  sequence_indexes = find_all_sequences(pattern, hash, 0, hash[pattern[0]][0]-1)
  min_sequence_length = str.size+1
  min_sequence_index = []
  sequence_indexes.each do |sequence_index|
    sequence_size = sequence_index.last - sequence_index.first
    if (sequence_size < min_sequence_length)
      min_sequence_length = sequence_size
      min_sequence_index = sequence_index
    end
  end
  str[min_sequence_index.first..min_sequence_index.last]
end

def find_all_sequences(pattern, hash, index, minVal)
  position = binary_search(hash[pattern[index]], minVal)
  values_to_consider = hash[pattern[index]][position..hash[pattern[index]].size-1]
  if (index == pattern.size-1)
    return values_to_consider
  end
 
  results = []
  values_to_consider.each do |str_index|
    arr = find_all_sequences(pattern, hash, index+1, str_index)
    results += arr.map do |next_value_index|
      [str_index, next_value_index]
    end 
  end
  results
end
