#Print all subsets of a set

# {} -> {}
# {a} -> {a}, {}
# {a,b} -> {a}, {b}, {a,b}, {}
# {a,b,c} -> {a}, {b}, {c}, {a,b}, {b,a}, {a,c}, {a,b,c} {}

#Number of subsets for a set of n numbers => 2^n

#Approach1: Total number of subsets is 2 raise to n. And each element
#of subset is unique and contains elemnet from given set. So if we
#consider subsets as numbers from 1 till 2^n-1, and assign each bit to
#each element in the set, you get all subsets except empty set
#by considering 1 as the element present in the sub set
# {a,b,c} => 2 ^n - 1 = 7 => 111
#001 - a
#010 - b
#011 - ab
#100 - c

#Explanation - For each subset, 2 states possible - element is in the set(Yes)
# or element not present in the set(No).. So each subset is sequence of such values
#"yes no no yes...". This gives 2^n possiblities
def subsets_1(set)
  number = 2**set.size-1
  for i in 0..number
    subset = []
    val = i
    index = 0
    while (val > 0)
      bit = val & 1
      subset << set[index] if bit == 1
      val >>= 1
      index += 1
    end
    subsets << [subset]
  end
  subsets
end

#Approach recursively. for 2 elements, just add 2nd element to each subset and add an empty subset
def subsets(set)
  new_sets = Array.new
  return [new_sets] if set.size == 0
  return [new_sets, set] if set.size == 1

  element_to_add = [set[0]]
  new_subsets = subsets(set[1..set.size-1])
  new_sets += new_subsets
  new_subsets.each do |subsets_values|
    new_sets << element_to_add + subsets_values
  end
  new_sets
end

puts subsets(['a'])
puts "---"
subsets(['a','b']).each do |set|
  if set == []
    print "{}"
  else
    print set
  end
  puts
end
