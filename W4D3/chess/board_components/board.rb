require_relative "pieces"

class Board
  def initialize
    ### amend below so that board grid is generated first, before pieces are placed in as we need to pass board information to piece
    @board = Array.new(8) {Array.new(8) {nil} }

    populate_board
  end
  
  attr_reader :board
  
  def [](pos)
    row, col = pos
    board[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    board[row][col] = val
  end

  def pieces ###will hold the pieces in an Array so it's easier to search for king and for enemy moves
    pieces = []

    board.each do |row|
      row.each do |piece|
        pieces << piece if !piece.is_a?(NullPiece)
      end
    end

    pieces
  end
  
  def move_piece(start_pos, end_pos)
    raise "Start position not on board, please check your input" if !valid_pos?(start_pos)
    raise "Target position invalid, please check your input again" if !valid_pos?(end_pos)
    raise "There is no piece at start_pos" if self[start_pos].color == :null  
    
    selected_piece = self[start_pos]

    selected_piece.pos = end_pos
    self[end_pos], self[start_pos] = selected_piece, NullPiece.instance
    
  end
  
  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def empty?(pos)  ### PH, might have to amend later when NULL COLOR changes
    self[pos].color == :null ? true : false
  end

  def checkmate?(color)
    ### determine if player is in check in_check?(color)

    ### if player(color) has no more valid moves, then return yes. MUST IMPLEMENT
    # ==> Piece#move_into_check?(end_pos)
  end

  def in_check?(color)
    king_pos = find_king(color)
    enemy_moves = possible_enemy_moves(color) ## returns a Set
    return true if enemy_moves.include?(king_pos)

    false
  end

  def possible_enemy_moves(color)
    enemy_moves = Set.new

    pieces.each do |piece|
        next if piece.color == color
        piece.moves.each {|pos| enemy_moves << pos}
    end

    enemy_moves
  end

  def find_king(color)
    pieces.each { |piece| return piece.pos if piece.is_a?(King) && piece.color == color}
  end

  ### graphics for Display class to read all arrays instead of Board objects.
  def graphics
    board_graphics = []
    board.each do |row|
      symbolic_row = []
      row.each {|ele| symbolic_row << ele.to_s }
      board_graphics << symbolic_row
    end
    board_graphics
  end
  
  ### Clean this up last please
  def populate_board
    black_back_row = [
      Rook.new(self, :black, [0, 0]),
      Knight.new(self, :black, [0, 1]),
      Bishop.new(self, :black, [0, 2]),
      Queen.new(self, :black, [0, 3]),
      King.new(self, :black, [0, 4]),
      Bishop.new(self, :black, [0, 5]),
      Knight.new(self, :black, [0, 6]),
      Rook.new(self, :black, [0, 7])
    ]
    board[0] = black_back_row
  
    black_front_row = []
      (0..7).each {|idx| black_front_row << Pawn.new(self, :black, [1, idx])}
    board[1] = black_front_row
  
    (2..5).each do |row|
      board[row] = Array.new(8) {NullPiece.instance} 
    end
  
    white_front_row = []
      8.times {|idx| white_front_row << Pawn.new(self, :white, [6, idx])}
    board[6] = white_front_row
  
    white_back_row = [
      Rook.new(self, :white, [7, 0]),
      Knight.new(self, :white, [7, 1]),
      Bishop.new(self, :white, [7, 2]),
      Queen.new(self, :white, [7, 3]),
      King.new(self, :white, [7, 4]),
      Bishop.new(self, :white, [7, 5]),
      Knight.new(self, :white, [7, 6]),
      Rook.new(self, :white, [7, 7]),
    ]
    board[7] = white_back_row
  end

end

