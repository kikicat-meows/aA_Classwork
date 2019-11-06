require_relative "piece"

class Board
  def initialize
    black_back_row = [Array.new(8) {Piece.new}]
    black_front_row = [Array.new(8) {Piece.new}]
    empty_space = Array.new(4) {Array.new(8) {nil} }  ### PH for NullPiece
    white_front_row = [Array.new(8) {Piece.new}]
    white_back_row = [Array.new(8) {Piece.new}]
    @board = black_back_row + black_front_row + empty_space + white_front_row + white_back_row
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
    raise "There is no piece at start_pos" if self[start_pos] == nil  ### PH for NullPiece

    self[end_pos], self[start_pos] = self[start_pos], nil ### PH for NullPiece
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

end