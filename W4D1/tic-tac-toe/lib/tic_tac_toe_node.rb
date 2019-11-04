require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)  ## evaluator is the mark of the player (that wants to know if they're winning or losing)
    if board.over?
      return board.won? && board.winner != evaluator
    end

    if self.next_mover_mark == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) } ## players turn, all children node (no matter what move we play) will result in a lose
    else 
      self.children.any? { |node| node.losing_node?(evaluator) } ## opponent's turn, once they play then there's an outcome they can force us to lose
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end

    if self.next_mover_mark == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) } ## next round is our turn, and there's 1 outcome in the children that can lead to us winning 
    else
      self.children.all? { |node| node.winning_node?(evaluator) }  ## next round is opponent turn, but all nodes (from now on) as children are winning nodes for us and we can force them to lose
    end
  end

  def children # all potential next moves 
    children = []

    ## iterate through all positions on board (skips to next position if it's not currently empty)
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        
        next unless board.empty?(pos)
        new_board = board.dup #duplicates the existing board (in order to place the next move in)
        new_board[pos] = self.next_mover_mark #puts the hypothetical move on the board

        next_mover_mark = ((self.next_mover_mark == :x) ? :o : :x)
        children << TicTacToeNode.new(new_board, next_mover_mark, pos) #generates a new instance of node that's in the children basically creates the tree of all possible next moves (and subsequent moves)
      end
    end

    children
  end
end
