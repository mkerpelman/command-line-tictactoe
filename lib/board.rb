class Board

    attr_reader :state

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

    

end