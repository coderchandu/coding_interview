#90 degree rotation NxN matrix

#  0  1  2 
#  3  4  5 
#  6  7  8 

# Expected =>    
#  2 5 8
#  1 4 7
#  0 3 6
def rotate_matrix(matrix)
  n = matrix.size-1
  for layer in 0..n/2
    first = layer
    last = n-1-layer
    for i in first..last
      offset = i - first
      tmp = matrix[first][i]
      matrix[first][i] = matrix[last-offset][first]
      matrix[last-offset][first] = matrix[last][last]
    end
  end 
end
