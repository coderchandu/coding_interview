#Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column is set to 0.

def print_matrix(matrix)
  for i in 0..matrix.size-1
    for j in 0..matrix[i].size-1
      print matrix[i][j], " "
    end
    puts ""
  end
end

def set_to_zero(matrix)
  rows_to_set = []
  cols_to_set = []

  for i in 0..matrix.size-1
    for j in 0..matrix[i].size-1
      if matrix[i][j] == 0
        rows_to_set[i] = 1
        cols_to_set[j] = 1
      end
    end
  end
  for i in 0..matrix.size-1
    for j in 0..matrix[i].size-1
      matrix[i][j] = 0 if rows_to_set[i] == 1 || cols_to_set[j] == 1
    end
  end
  print_matrix(matrix)
end

set_to_zero([[1,0,3],[4,5,6]])
