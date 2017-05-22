#Given a matrix of integers where every element represents weight of the cell. Find the path having the maximum weight in matrix [N X N]. Path Traversal Rules are:
#It should begin from top left element.
#The path can end at any element of last row.
#We can move to following two cells from a cell (i, j).
#Down Move : (i+1, j)
#Diagonal Move : (i+1, j+1)

def max_weight_value(matrix)
  rows = matrix.size
  cols = matrix[0].size
  weight = Array.new(rows) { Array.new(cols)}
  weight[0][0] = matrix[0][0]
  for j in 1..cols-1 # No other columns in 1st row is accessible as per movement rule
    weight[0][j] = 0
  end
  for i in 1..rows-1
    weight[i][0] = weight[i-1][0] + matrix[i][0]
  end
  for i in 1..rows-1
    for j in 1..cols-1
      weight[i][j] = matrix[i][j] + [weight[i-1][j], weight[i-1][j-1]].max
    end
  end

  weight[matrix.size-1].max
end

puts max_weight_value([
  [4, 2 ,3 ,4 ,1],
  [2 , 9 ,1 ,10 ,5],
  [15, 1 ,3 , 0 ,20],
  [16 ,92, 41, 44 ,1],
  [8, 142, 6, 4, 8]
])
