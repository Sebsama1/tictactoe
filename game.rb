class Player
    attr_reader :name
    def initialize(name)
        @name = name
        @state = "unknown"
    end

    def wins
        @state = "winner"
    end
end

class Game

    def initialize
                ## Initialisation des joueurs
        puts "          ===============              "
        puts "PREPARE FOR THE ULTIMATE TICTACTOE MATE"
        puts "          ===============              "
        puts
        puts "Please enter name of player 1"
        name_player1 = gets.chomp
        @player1 = Player.new("#{name_player1}")
        puts "Please enter name of player 2"
        name_player2 = gets.chomp
        @player2 = Player.new("#{name_player2}")
        puts "The battle will be between " + @player1.name + " and " + @player2.name
        @board= Board.new
        self.menu

    end

    def menu
        rep = nil
        while rep != "q"
            puts "Play or Quit ? p/q"
            rep = gets.chomp
            self.play if rep == "p"
        end
    end


    def play
        @board.reset
        winner = nil
        @board.show
        until winner != nil || @board.is_full? == true do

            choice = ""
            choice_is_valid = false

            until choice_is_valid do
                puts "#{@player1.name} turn : your choice ?"
                choice = gets.chomp
                if @board.cases[choice.to_i].is_empty?
                    @board.cases[choice.to_i].state = "X"
                    choice_is_valid = true
                else
                    puts "Wrong choice mate n° 1, try that again"
                end
            end

            @board.show

            winner = self.have_a_winner

            if winner == nil && !@board.is_full?
                choice_is_valid = false
                until choice_is_valid do
                    puts "#{@player2.name} turn : your choice ?"
                    choice = gets.chomp
                    if @board.cases[choice.to_i].is_empty?
                        @board.cases[choice.to_i].state ="O"
                        choice_is_valid= true
                    else
                        puts "Wrong choice mate n° 2, try that again"
                    end
                end
                @board.show
            end

        end
        puts "game finished"
        if winner != nil
            puts "And ... The winner is " + winner.name
        elsif @board.is_full?
            puts "Oï ! It's a tie!"
        end

    end

    def have_a_winner
        [1,4,7].each { |n|
            if @board.cases[n].state == "X" && @board.cases[n + 1].state == "X" && @board.cases[n + 2].state == "X"
                return @player1
            elsif @board.cases[n].state == "O" && @board.cases[n + 1].state == "O" && @board.cases[n + 2].state == "O"
                return @player2
            end
        }
        [1,2,3].each { |n|
            if @board.cases[n].state == "X" && @board.cases[n + 3].state == "X" && @board.cases[n + 6].state == "X"
                return @player1
            elsif @board.cases[n].state == "O" && @board.cases[n + 3].state == "O" && @board.cases[n + 6].state == "O"
                return @player2
            end
        }

            if @board.cases[1].state == "X" && @board.cases[5].state == "X" && @board.cases[9].state == "X"
                return @player1
            elsif @board.cases[1].state == "O" && @board.cases[5].state == "O" && @board.cases[9].state == "O"
                return @player2
            end
            if @board.cases[3].state == "X" && @board.cases[5].state == "X" && @board.cases[7].state == "X"
                return @player1
            elsif @board.cases[3].state == "O" && @board.cases[5].state == "O" && @board.cases[7].state == "O"
                return @player2
            end

        return nil
    end

end

class Board
    attr_accessor :cases
    def initialize
        @cases = [0, BoardCase.new(1," "), BoardCase.new(2," "), BoardCase.new(3," "), BoardCase.new(4," "), BoardCase.new(5," "), BoardCase.new(6," "), BoardCase.new(7," "), BoardCase.new(8," "), BoardCase.new(9," ")]
    end

    def show
    	puts "  Board state       Positions"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[1].state.to_s + " | " + @cases[2].state.to_s + " | " + @cases[3].state.to_s + " |    | 1 | 2 | 3 |"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[4].state.to_s + " | " + @cases[5].state.to_s + " | " + @cases[6].state.to_s + " |    | 4 | 5 | 6 |"
    	puts "  ---+---+---      ---+---+---      "
        puts  " | " + @cases[7].state.to_s + " | " + @cases[8].state.to_s + " | " + @cases[9].state.to_s + " |    | 7 | 8 | 9 |"
    	puts "  ---+---+---      ---+---+---      "
        puts
    end

    def reset
        @cases[1].state = " "
        @cases[2].state = " "
        @cases[3].state = " "
        @cases[4].state = " "
        @cases[5].state = " "
        @cases[6].state = " "
        @cases[7].state = " "
        @cases[8].state = " "
        @cases[9].state = " "
    end

    def is_full?
        @cases.each do |c|

            if c != 0 && c.state == " "
                return false
            end
        end
        return true
    end

end

class BoardCase
    attr_reader :number
    attr_accessor :state #change it to protect it
    def initialize(number, state)
        @number = number
        @state = state
    end

    def is_empty?
        return @state == " "
    end

end

#my_game = Game.new


my_board = Board.new()
my_board.cases[1].state="X"
my_board.cases[3].state="X"
my_board.cases[7].state="O"
my_board.cases[8].state="O"

my_board.show

my_board.reset

my_board.show

