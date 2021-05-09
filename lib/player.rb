class Player

    def initialize(name, marker)
        @name = name
        @marker = marker
    end

    def get_guess
        print "#{name}, select a cell to put your mark on: "
        selected_cell = gets.chomp.to_i
        until (1..9).to_a.include?(selected_cell)
            print "Selection must be a number between 1 and 9, try again: "
            selected_cell = gets.chomp.to_i
        end
        selected_cell
    end

end