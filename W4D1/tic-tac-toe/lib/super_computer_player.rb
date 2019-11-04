require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    ttt_node = TicTacToeNode.new(game.board, mark)
    ttt_node.children.each do |node|
      return node.prev_move_pos if node.winning_node?(mark)
    end
    ttt_node.children.each do |node|
      return node.prev_move_pos if !node.losing_node?(mark)
    end
    raise "Something went wrong."
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Cole")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
