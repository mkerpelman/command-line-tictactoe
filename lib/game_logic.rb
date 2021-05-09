require './lib/board.rb'

class GameLogic

    def initialize
        @board = Board.new
    end

    def get_guess(name)
        print "#{name}, select a cell to put your mark on: "
        selected_cell = gets.chomp.to_i
        until (1..9).to_a.include?(selected_cell) && empty_cell?(selected_cell)
            print "Selection must be an empty cell between 1 and 9, try again: "
            selected_cell = gets.chomp.to_i
        end
        selected_cell
    end

    def mark_cell(marker, cell)
        @board.state[get_row_from(cell)][get_col_from(cell)] = marker
    end

    def empty_cell?(cell)
        @board.state[get_row_from(cell)][get_col_from(cell)] == " "
    end

    private

    def get_row_from(cell)
        if (1..3).to_a.include?(cell)
            0
        elsif (4..6).to_a.include?(cell)
            1
        else
            2
        end
    end

    def get_col_from(cell)
        if [1, 4, 7].include?(cell)
            0
        elsif [2, 5, 8].include?(cell)
            1
        else
            2
        end
    end

end