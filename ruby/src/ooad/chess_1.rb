MVC pattern with event driven UI


Event listeners in controller which listens to key board or mouse events

MVC
------
Game, Board models represents domain specific data - In chess game, information about initial position and the game
record to reproduce current positions can be stored. The model and controller implement a finite state
machine which controls the game, its state, stsate transitions etc. The view displays the game notation, a list
of moves and the board with current position. Controller receives input from various sources like keyboard, mouse etc, or internet socket
and initiates a response by making calls on model objects.

The Game loop
-------------

state := playGame;
initialize position
print board
while (state != gameover)
   wait_for_input_from_move
   make move (if legal)
   if (mate or stalemate) {
      state := gameOver;
      break;
   }
   search move with allocated time
   make move
   print move and update board
   if (mate or stalemate)
      state := gameOver;
}
print "thank you for playing the game";



Event driven GUIs

Event listeners are registered by controller

Architecture
----------
A central server handles connections of player hosts and its server resp to connect the players
https://en.wikipedia.org/wiki/Board_representation_(chess)

Game.move(player, currentSpot, NewSpot);

class Game
  player1 = Player.new(white)
  player2 = Player.new(black)
  board = Board.new
  moveHistory = {} #Map<Player, array[2][2]> #history of moves from one co-ord to another
  
  def move(player, currentSpot, newSpot)
end

class Board
  width, height #If we need to be flexible
  spots #One spot for each x,y position in the board
  pieces[2][16]
  removedPieces

  def initialize(height=8, width=8)
    @width = width
    @height = height
    setupBoard
  end

  def setupBoard
    @spots = Array.new(@height) {Array.new(@width)}
    for i in 0..@height-1
      for j in 0..@width-1
        @spots[i][j] = Spot.new(EmptyPiece)
      end
    end
    Piece::AVAILABLE_PIECES.each do |piece|
      @spots[b
    end
  end

  def getSpot(x,y)
    @spots[x][y]
  end

  def getPiece(x,y)
    @spots[x][y].getPiece 
  end
 
  def removePiece(x,y)

  end

  def addPiece(x,y)

  end

  def movePiece(piece, currentSpotX, currentSpotY, newSpotx, newSpoty)
    if (getSpot(currentSpotX, currentSpotY) != piece)
      raise "Unexpected move requested for piece #{piece}"
    end
        
    new_spot_to_move = getSpot(newSpotX, newSpotY)
    new_spot_to_move.addPiece(piece)

    #if (valid_move(piece, currentSpot, newSpot))
    #  piece.move!(newSpot)
    #end
    if (checkMate?)
      inform_client
    end
  end

  def removePiece(piece, x, y)
    spot = getSpot(x,y)
    spot.removePiece(piece)
  end

  def checkMate?()
    #Alternative: Go to all possible paths from king and see if there is a piece in any of the paths
    #http://stackoverflow.com/questions/16803893/chess-getting-all-legal-chess-moves
    pieces[currentPlayer].each do |piece|
      piece.valid_move?(piece.currentSpot, pieces.getKing().currentSpot) #If any piece of opponent
    end
  end

  def valid_move?(currentSpot, newSpot)
    spot = Spot.get(currentSpot)
    piece = spot.occupiedPiece
    
  end
end

class Spot
  occupiedPiece #
  removedPieces

  def initialize(x, y)
    @occupiedPiece = Piece.new(Piece::Empty)
  end

  def addPiece(piece)
    removePiece
    @occupiedPiece = piece #Automatically removes existing piece
  end

  def removePiece
    @occupiedPiece = Piece.new(Piece::Empty)
  end
end

class Player
  name
  color (white, black) #0, 1
  pieces

  def initialize(color)
    @color = color
  end

end

class Piece
  EMPTY = 0
  ROOK=1
  KNIGHT=2
  BISHOP=3
  KING=4
  QUEEN=5
  AVAILABLE_PIECES = [ROOK, KNIGHT, BISHOP, KING, QUEEN]

  value #one in available_pieces
  color #0 for black, 1 for white

  movement_rules #List of rules
  properties #Hash map with different properties and their values

  def initialize(piece, color)
    @color = color
    @piece = piece
  end
	
  move(new_spot)
    new_spot.setPiece(piece)
  end

  def is_valid_move?(newSpot)
    #check boundary
  end

  def setProperty(property, value)
    @properties ||= {}
    @porperties[property] = value
  end

  def getProperty(property)
    @properties[property]
  end

  def setMovementRules(rules)
    @movement_rules ||= Set.new
    @movement_rules << rules
  end

  def getMovementRules
    @movement_rules || []
  end
end

class PieceGroups
  pieces

  def initialize
    @pieces = []
  end

  def addPiece(piece)
    pieces << piece
  end

  def removePiece(piece)
    pieces << piece
  end
end

class Empty < Piece

end

class Pawn < Piece
  is_valid_move?()
    return false if !super.is_valid_move?()

    #check pawn specific move
  end
end

class Bishop < Piece

end

class Movement
  :movement_algo, :legal_move_check

  def initialize(legal_move_check)

  end

  def move

  end
end

class BishopMovement < Movement

end

