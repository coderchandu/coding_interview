#Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? 
#Find all unique triplets in the array which gives the sum of zero
def three_sum(arr)
  arr.sort!

  triplets = Array.new { Array.new(3) }
  for k in 2..arr.size-1
    sum = -arr[k]
    i = 0
    j = k-1
    while (i<j)
      if arr[i] + arr[j] == sum
        triplets << [arr[i], arr[j], arr[k]]
        i+=1
        j-=1
      elsif arr[i] + arr[j] > sum
        j -= 1
      else
        i += 1
      end
    end
  end
  triplets
end

arr = three_sum([-1, 0, 1, 2, -1, -4])

arr.each do |triplet|
  print triplet
end
