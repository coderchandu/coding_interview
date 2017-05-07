# Given a Tic Tac Toe board and the current player, can this player win the game in one move?
# Input: Array of arrays, storing booleans. '1' or 'true' is X, '0' or 'false' is O. 'nil' is an unfilled cell.
# Output: 'true', meaning the player can win, or 'false', meaning the player cannot win in one move.

# Example input 1:
# [ [1, 1, nil],
#   [0, 0, nil],
#   [1, 0, nil] ]
#  Player X
# Example output 1:
# true

# Example input 2:
# [ [0, nil, nil],
#   [1, 1,   0],
#   [0, 1,   nil] ]
#  Player X
# Example output 2:
# true

# Example input 3:
# [ [0,   nil, 1],
#   [1,   0,   1],
#   [nil, nil, nil] ]
#  Player Y
# Example output 3:
# true
class Player
  attr_accessor :value  #0,1
end

class TicTacToe
  attr_accessor :arr
  
  def initialize(arr=nil)
    @arr = arr || Array.new(3) { Array.new(3)}
  end

  def canPlayerWinEfficient(playerValue)
    #Random values assigned to each values '1', '0' and 'nil' to differentiate the win target
    hash = {0 => 5, 1 => 3, nil => 1}
    rowCount = Array.new(@arr.size, 0)
    colCount = Array.new(@arr.size, 0)
    diagonalCount = 0
    antiDiagonalCount = 0
    for i in 0..@arr.size-1
      for j in 0..@arr[i].size-1
        val = hash[@arr[i][j]]
        rowCount[i] += val
        colCount[j] += val
        diagonalCount += val if i == j
        antiDiagonalCount += val if i+j == @arr.size-1
      end
    end
    winScore = [hash[playerValue]*@arr.size, hash[playerValue]*(@arr.size-1) + 1]
    return true if won?(diagonalCount, winScore) || won?(antiDiagonalCount, winScore)
    for i in 0..@arr.size
      return true if won?(rowCount, winScore)
    end
    for i in 0..@arr.size
      return true if won?(colCount, winScore)
    end
    false
  end

  def won?(count, winScore)
    winScore.include?(count)
  end

  def canPlayerWin(playerValue)
    @diagonal = []
    for i in 0..@arr.size-1
      for j in 0..@arr[i].size-1
        if (i==j)
          @diagonal[i] = @arr[i][j]
        end
      end
    end
    @antiDiagonal = []
    i = 0
    j = @arr[0].size-1
    while (j>=0)
      @antiDiagonal << @arr[i][j]
      j -= 1
      i += 1
    end
      
    for i in 0..@arr.size-1
      for j in 0..@arr[i].size-1
        if (@arr[i][j] == nil)
          @arr[i][j] = playerValue
          if (hasRowWon(i, j, playerValue) || hasColumnWon(i, j, playerValue) || hasDiagonalWon(i,j,playerValue))
            return true
          end
          @arr[i][j] = nil
        end
      end
    end
    return false
  end
  
  def hasRowWon(i, j, value)
    for col in 0..@arr[i].size-1
      if (@arr[i][col] != value)
        return false
      end        
    end
    return true
  end

  def hasColumnWon(i, j, value)
    for row in 0..@arr.size-1
      return false if (@arr[row][j] != value)
    end
    return true
  end
  
  def hasDiagonalWon(i, j, value)
    if (i == j)
        for row in 0..@diagonal.size-1
          return false if (@diagonal[row] != value)
        end
        if (i == @arr.size/2)
           return checkAntiDiagonal(i,j,value)
        end
        return true
    end
    checkAntiDiagonal(i,j,value)
  end
  
  def checkAntiDiagonal(i, j, value)
    for row in 0..@antiDiagonal.size-1
      return false if (@antiDiagonal[row] != value)
    end
    return true
  end
end

puts TicTacToe.new([ [0, nil, nil, nil],
                     [1, 0,   0, 1],
                     [0, 0,   1, 0],
                     [0, 1,   1, nil ] ]).canPlayerWin(0)
puts TicTacToe.new([[1, 1, nil],[0, 1, nil],[1, 0, nil]]).canPlayerWin(0)
puts TicTacToe.new([ [0, nil, nil, nil],
                     [1, 0,   0, 1],
                     [0, 0,   1, 0],
                     [0, 1,   1, nil ] ]).canPlayerWinEfficient(1)
puts TicTacToe.new([
[1, 0, 1],
[0, nil, nil],
[1, 0, nil]]).canPlayerWinEfficient(1)
