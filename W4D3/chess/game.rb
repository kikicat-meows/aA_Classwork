require_relative "parts"
require "byebug"

class Chess

    attr_reader :board, :display, :player_1, :player_2
    attr_accessor :current_player

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player_1 = HumanPlayer.new(:white, @display)
        @player_2 = HumanPlayer.new(:black, @display)
        @current_player = @player_1
    end

    def play
        # debugger
        until board.checkmate?(@current_player.color)
            display.render
            
            puts "Player #{current_player.color}, please select a piece: row col"
            start_pos = @current_player.make_move

            puts "Where would you like to place it? row col"
            end_pos = @current_player.make_move

            board.move_piece(start_pos, end_pos)
            swap_turn!
        end

        puts "Checkmate! #{@current_player.color.to_s} has lost."
    end


    def swap_turn! ### swaps current_player
        @current_player == @player_1 ? 
            @current_player = @player_2 : @current_player = @player_1
    end
end

if __FILE__ == $PROGRAM_NAME
    Chess.new.play
end