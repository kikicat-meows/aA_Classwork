### able to move in a straight line using slideable 
require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable
  def symbol
    if self.color == :white
      symbol = "\u2655"
    else
      symbol = "\u265b"
    end
    symbol.encode('utf-8')
  end

  protected
  def move_dirs
    linear + diagonal
  end
end