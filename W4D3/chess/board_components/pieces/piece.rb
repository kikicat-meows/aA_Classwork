class Piece
  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
  end

  def to_s  ### symbols are already strings
    self.symbol.to_s
  end
  
  def pos=(val)
    @pos = val if board.valid_pos?(val)
  end

  # def valid_moves
    
  # end

  # def move_into_check?(end_pos)
    
  # end

  def moves
    '' ### no real moves, will be individual in class (generates array of moves)
  end

  def symbol
    '' ### overwrite in each class
  end

  attr_reader :board, :color, :pos
end