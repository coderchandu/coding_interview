#Write an algorithm to print all ways of arranging eight queens on a chess board so that none of them share 
#the same row, column or diagonal.

#For this, we need to store the column of the queen in each row as soon as we have finalized it. Let ColumnForRow[] be the array which stores the column number for each row.
#On same Column : ColumnForRow[i] == ColumnForRow[j]
#On same Diagonal: (ColumnForRow[i] - ColumnForRow[j] ) == ( i- j) or (ColumnForRow[j] - ColumnForRow[i]) == (i - j)


class EightQueen
@@columnForRow = Array.new(8)

def printQueens
  placeQueen(0)
end

def placeQueen(row)
  if (row == 8)
    printBoard
    return
  end
  for i in 0..7
    @@columnForRow[row] = i
    if (valid?(row))
      placeQueen(row+1)
    end     
  end
end

def valid?(row)
  for i in 0..row-1
    diff = (@@columnForRow[i] - @@columnForRow[row]).abs
    return false if diff == 0 || diff == row-i
  end
  true
end

def printBoard
  for i in 0..8
    for j in 0..8
      if (@@columnForRow[i] == j)
        print "Q "
      else
        print ". "
      end
    end
    puts
  end
  puts puts
end
end

EightQueen.new.printQueens
