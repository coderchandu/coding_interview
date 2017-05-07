#0-1 Knapsack
#Given weights and values of n items, put these items in a knapsack of capacity W to get the maximum total value in the knapsack
#In other words, given two integer arrays val[0..n-1] and wt[0..n-1] which represent values and weights associated 
#with n items respectively. Also given an integer W which represents knapsack capacity, find out the maximum value
# subset of val[] such that sum of the weights of this subset is smaller than or equal to W. We cannot break an item, either
# pick the complete item, or don’t pick it (0-1 property).

#Here W <= 2000000 and n <= 500

#Input : W = 10, n = 3;; val[] = {7, 8, 4};; wt[] = {3, 8, 6}
#Output: 11 => We get maximum value by picking items of 3 KG and 6 KG.

#To find the actual values which makes to knapsack, add another boolean matrix which says
#an element is used or not. Use this matrix to keep track
def max_value_recurse(values, weights, max_weight, index=values.size-1)
  return 0 if max_weight == 0 || values.size == 0 || index < 0
  
  if (weights[index] > max_weight)
    return max_value_recurse(values, weights, max_weight, index-1)
  end
  [values[index] + max_value_recurse(values, weights, max_weight-weights[index], index-1),
     max_value_recurse(values, weights, max_weight, index-1)].max
end

def max_value_dp(values, weights, max_weight)
  max_values = Array.new(values.size+1) { Array.new(max_weight+1) }
  used = Array.new(values.size+1) { Array.new(max_weight+1, false) }

  for i in 0..values.size
    max_values[i][0] = 0
  end
  for j in 0..max_weight
    max_values[0][j] = 0
  end
  for i in 1..values.size
    for w in 1..max_weight
      if (weights[i-1] > w) # If weight is greater than max weight, can't include current value. Return prev max
        used[i-1][w] = false
        max_values[i][w] = max_values[i-1][w]
      else
        if (values[i-1] + max_values[i-1][w-weights[i-1]] > max_values[i-1][w])
          max_values[i][w] = values[i-1] + max_values[i-1][w-weights[i-1]]
          used[i][w] = true
        else
          used[i][w] = false
          max_values[i][w] = max_values[i-1][w]
        end
      end
    end
  end

  i = values.size
  j = max_weight
  puts "printing values value=#{values}, weights=#{weights} max=#{max_weight}\n----------"
  while (i>0 && j>0)
    if (used[i][j])
      print values[i-1], " "
      j = j - weights[i-1]
    end
    i -= 1
  end
  puts "\n----------"
  max_values[values.size][max_weight]
end

puts max_value_recurse([7, 8, 4, 9], [7, 8, 6, 9], 14)
puts max_value_dp([7, 8, 4, 9], [7, 8, 6, 9], 14)
puts max_value_recurse([60, 100, 120], [10, 20, 30], 50)
puts max_value_dp([60, 100, 120], [10, 20, 30], 50)

puts max_value_dp([10,40,30,50], [5,4,6,3], 10)
