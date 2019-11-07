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
  
  def move_piece(start_pos, end_pos)
    raise "Start position not on board, please check your input" if !valid_pos?(start_pos)
    raise "Target position invalid, please check your input again" if !valid_pos?(end_pos)
    raise "There is no piece at start_pos" if self[start_pos].color == :null  
    
    self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance 
  end
  
  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def empty?(pos)  ### PH, might have to amend later when NULL COLOR changes
    self[pos].color == :null ? true : false
  end

  ### display_symbol for Display class to read all arrays instead of Board objects.
  def display_symbol
    board_graphics = []
    board.each do |row|
      symbolic_row = []
      row.each {|ele| symbolic_row << ele.to_s }
      board_graphics << symbolic_row
    end
    board_graphics
  end
  
  
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
  
    black_front_row = []###Remember to change this later
      (0..7).each {|idx| black_front_row << Pawn.new(self, :black, [1, idx])}
    board[1] = black_front_row
  
    empty_row = Array.new(8) {NullPiece.instance} 
    (2..5).each do |row|
      board[row] = empty_row
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

