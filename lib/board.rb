class Board

    def initialize
        @state = Array.new(3) { Array.new(3, " ")}
    end

    def display
        system "clear"
        puts "   BOARD       CELL GUIDE"
        puts " #{@state[0][0]} | #{@state[0][1]} | #{@state[0][2]}     1 | 2 | 3"
        puts "--- --- ---   --- --- ---"
        puts " #{@state[1][0]} | #{@state[1][1]} | #{@state[1][2]}     4 | 5 | 6"
        puts "--- --- ---   --- --- ---"
        puts " #{@state[2][0]} | #{@state[2][1]} | #{@state[2][2]}     7 | 8 | 9"
    end

    def mark(marker, cell)
        @state[get_row_from(cell)][get_col_from(cell)] = marker
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

x = Board.new
x.mark("X", 1)
x.display