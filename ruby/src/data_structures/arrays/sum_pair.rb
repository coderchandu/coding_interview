#Design an algorithm to find all pairs of integers within an array which sum to a specified value.

def find_pairs(arr, sum)
  hash = {}
  arr.each do |a|
    hash[a] = 0 unless hash.key?(a)
    hash[a] += 1
  end
  arr.each do |a|
    value = hash[sum - a]
    next unless value
    next if a == (sum-a) && value < 2
    puts a, sum-a
    hash[a] -= 1
    hash[sum-a] -= 1
    hash.delete(a) if hash[a] <= 0
    hash.delete(sum-a) if hash[sum-a] && hash[sum-a] <= 0
  end
end

def find_pair_sorted_array(arr, sum)
  arr.sort!
  first = 0
  last = arr.size-1
  while (first < last)
    current_sum = arr[first] + arr[last]
    if current_sum == sum
      print arr[first], " ", arr[last], "\n"
      first += 1
      last -= 1
    elsif current_sum < sum
      first += 1
    else
      last -= 1
    end
  end
end

puts "find 1"
find_pairs([4,4,4,4], 8)
puts "find 2"
find_pairs([4,5], 8)
puts "find 3"
find_pairs([-3,4,5,1,2,3,-5], 0)
puts "find 1"
find_pair_sorted_array([4,4,4,4], 8)
puts "find 2"
find_pair_sorted_array([4,5], 8)
puts "find 3"
find_pair_sorted_array([-3,4,5,1,2,3,-5], 0)
