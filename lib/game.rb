require './lib/game_logic.rb'
require './lib/player.rb'
require './lib/board.rb'

class Game

    include GameLogic

    def play
        system "clear"
        puts "**WELCOME TO TIC-TAC-TOE!**"
        @board = Board.new
        @p1 = Player.new(self.get_player_info(1), "X")
        @p2 = Player.new(self.get_player_info(2), "O")
        puts "\n#{@p1.name} is #{@p1.marker}'s, #{@p2.name} is #{@p2.marker}'s."
        @turn = 1
        @win = false
        self.start_logic
    end

    private

    def start_logic
        until @win == true || @turn > 9
            if @turn % 2 != 0
                @board.display
                mark_cell(@p1.marker, get_guess(@p1.name))
                @turn  += 1
            else
                @board.display
                mark_cell(@p2.marker, get_guess(@p2.name))
                @turn  += 1
            end
            self.win?
        end
        @board.display
        if @win == true
            if @turn % 2 !=0
                puts "\n#{@p2.name} wins!"
            else
                puts "\n#{@p1.name} wins!"
            end
        else
            puts "\nGame over, it's a tie."
        end
    end

end