require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton
  
  def symbol
    " "
  end

  def initialize
    super(nil, :null, "")
  end

  def moves
    []
  end

end