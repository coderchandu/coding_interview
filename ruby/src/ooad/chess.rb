#Keep track of time, end of game etc.
class GameController
  ROWS = 8
  COLUMNS = 8
  attr_accessor :turn, :board, :players, :instance, :moveLists 

  def initialize()
    @board = new Board(ROWS, COLUMNS)
    @players = Array.new(2)
    @players[0] = new Player(:black)
    @players[1] = new Player(:white)
    @turn = @players[1]
    @moveLists = Array.new
  end

  def self.getInstance
    @instance ||= GameController.new
  end

  def getBoard
    @board
  end

  def play 
    while (@board.status != GAMEOVER)
      processTurn(@turn, currentPos, newPos)
    end
  end

  def processTurn(player, currentPosition, newPosition)
    return false if @turn != player 
  
    player.makeMove(currentPosition, newPosition)
    @turn = (player == @players[0]) ? @players[1] : @players[0]
  end

  def isChecked

  end

  def isGameOver

  end

end

class Move
  attr_accessor :startPos, :endPos, :piece, :capturedPiece
end

class Board
  attr_accessor :tiles, :blackPieces, :whitePieces, :removedPieces

  def initialize(rows, columns)
    @tiles = Array.new(rows) { Array.new(columns)}
    initialize_pieces(:white)
    initialize_pieces(:black)
    fillBoard
  end

  def initialize_pieces(color)
    pieces = []
    pieces << King.new(color)
    pieces << Queen.new(color)
    pieces += [Horse.new(color), Horse.new(color)]
    pieces += [Rook.new(color), Rook.new(color)]
    pieces += [Bishop.new(color), Bishop.new(color)]
    for i in 1..16
      pieces << Pawn.new(color)
    end
    (color == :white) ? @whitePieces = pieces : @blackPieces = pieces
  end

  def fillBoard
    
  end

  def placePiece(row, column, piece)
    return false if (@tiles[row][column] != null)

    if piece.can_place?(@tiles, row, column) 
      piece.setLocation(row, column)
    end
  end

  def printBoard
    for i in 0..board.size-1
      for j in 0..board[0].size-1
        print @board[i][j].color if @board[i][j]
      end
      puts
    end 
  end
end

class Tile
  attr_accessor :x, :y, :occupiedPiece

  def initialize(x,y)
    @x = x
    @y = y
  end

  def setPiece(piece)
    tmp = @occupiedPiece
    if @occupiedPiece.nil? || @occupiedPiece.color != piece.color
      @occupiedPiece = piece 
    end
    return tmp
  end

  def removePiece
    @occupiedPiece = nil
  end
end

class Player
  attr_accessor :color, :name

  def initialize(name, color)
    @color = color
    @name = name
  end

  def getColor
    @color
  end

  def makeMove(currentPosition, newPosition)

  end
end

def Position
  attr_accessor :row, :col
end

class Piece
  KING = 1
  QUEEN = 2
  HORSE = 3
  BISHOP = 4
  ROOK = 5
  PAWN = 6

  attr_accessor :color, :value

  def initialize(color, value)
    @color = color
    @value = value
  end

  def valid_move?(row, column)

  end
end

class King < Piece
  def initialize(color)
    super(color, KING)
  end
end

class Queen < Piece
  def initialize(color)
    super(color, QUEEN)
  end
end

class Rook < Piece
  def initialize(color)
    super(color, ROOK)
  end
end

class Bishop < Piece
  def initialize(color)
    super(color, BISHOP)
  end
end

class Horse < Piece
  def initialize(color)
    super(color, HORSE)
  end
end

class Pawn < Piece
  def initialize(color)
    super(color, PAWN)
  end
end

