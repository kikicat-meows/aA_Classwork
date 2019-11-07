require_relative '../interface/display'

class HumanPlayer

    attr_reader :color, :display

    def initialize(color, display)
        @color = color
        @display = display
    end

    def make_move
        pos = gets.chomp.split(" ")

        # end_pos = nil

        # until start_pos
        #     start_pos = @display.cursor.get_input 
        # end

        # pos
    end
end