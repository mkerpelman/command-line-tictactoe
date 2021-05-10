require './lib/board.rb'

module GameLogic

    def get_guess(name)
        print "\n#{name}, select a cell to put your mark on: "
        selected_cell = gets.chomp.to_i
        until (1..9).to_a.include?(selected_cell) && empty_cell?(selected_cell)
            print "Selection must be an empty cell between 1 and 9, try again: "
            selected_cell = gets.chomp.to_i
        end
        selected_cell
    end

    def get_player_info(number)
        print "Player #{number}, please enter your name: "
        gets.chomp
    end

    def mark_cell(marker, cell)
        @board.state[get_row_from(cell)][get_col_from(cell)] = marker
    end
    
    def win?
        if self.horizontal_line? || self.vertical_line? || self.diagonal_line?
            @win = true
        else
            @win = false
        end
    end
    def horizontal_line?
        conditions = []
        for row in (0..2)
            all_same = @board.state[row].all? { |value| value == "X" } || @board.state[row].all? { |value| value == "O" }
            conditions << all_same
        end
        conditions.any? { |condition| condition == true }
    end

    def vertical_line?
        conditions = []
        for col in (0..2)
            all_same = [@board.state[0][col], @board.state[1][col], @board.state[2][col]].all? { |value| value == "X" } || [@board.state[0][col], @board.state[1][col], @board.state[2][col]].all? { |value| value == "O" }
            conditions << all_same
        end
        conditions.any? { |condition| condition == true }
    end


    def diagonal_line?
        a = [@board.state[0][0], @board.state[1][1], @board.state[2][2]].all? { |value| value == "X" }
        b = [@board.state[0][0], @board.state[1][1], @board.state[2][2]].all? { |value| value == "O" }
        c = [@board.state[0][2], @board.state[1][1], @board.state[2][0]].all? { |value| value == "X" }
        d = [@board.state[0][2], @board.state[1][1], @board.state[2][0]].all? { |value| value == "O" }
        [a, b, c, d].any? { |condition| condition == true}
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

    def empty_cell?(cell)
        @board.state[get_row_from(cell)][get_col_from(cell)] == " "
    end

end