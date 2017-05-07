# "abc" => "abc", "acb", "bca", "bac", "cab", "cba"

# Base cases "a" => ["a"]
#            "ab" => ["ab", "ba"]
class StringPermutation
  def self.get_permutations(str)
    return [str[0].to_s] if str.length == 1
    
    sub_array = get_permutations(str[0..str.size-2])
    char_to_add = str[str.size-1].to_s

    permutations = []
    sub_array.each do |str|
      permutations << (char_to_add + str)
      for i in 0..str.size-1
        permutations << str[0..i] + char_to_add + str[i+1..str.size-1]
      end
    end
    permutations
  end
end


def permut_values(str, start_index=0)
  return [] if str.size <= start_index
  return [str[start_index].to_s] if start_index == str.size-1

  result = []
  sub_permuts = permut_values(str, start_index+1)
  sub_permuts.each do |val|
    result << (str[start_index].to_s + val)
    for i in 0..val.size-1
      result << val[0..i] + str[start_index].to_s + val[i+1..val.size-1]
    end
  end
  result
end

puts "permutations 1 => #{StringPermutation.get_permutations("a")}"
puts "permutations 2 => #{StringPermutation.get_permutations("ab")}"
puts "permutations 3 => #{StringPermutation.get_permutations("abc")}"
puts "permutations 4 => #{StringPermutation.get_permutations("abcd")}"
puts "Compare with this"
puts "permutations 1 => #{permut_values("a")}"
puts "permutations 2 => #{permut_values("ab")}"
puts "permutations 3 => #{permut_values("abc")}"
puts "permutations 4 => #{permut_values("abcd")}"
