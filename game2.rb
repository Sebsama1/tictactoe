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
        puts "Please enter name of player 1"
        name_player1 = gets.chomp
        @player1 = Player.new("#{name_player1}")
        puts "Please enter name of player 2"
        name_player2 = gets.chomp
        @player2 = Player.new("#{name_player2}")
        puts "The battle will be between " + @player1.name + " and " + @player2.name
        @board= Board.new
    end

    def play
        @board.reset
        winner = nil
        until winner != nil do
            
            choice = ""
            choice_is_valid = false
            until choice_is_valid do 
                puts "#{@player1.name} turn : your choice ?"
                choice = user.gets.chomp
                if Board.cases[choice].is_empty
                    state = "X"
                    choice_is_valid= true
                else 
                    puts "Wrong choice mate nb 1, try that again"
                end
            end

            Board.show

            if winner == nil
                choice_is_valid = false
                until choice_is_valid do 
                    puts "#{@player2.name} turn : your choice ?"
                    choice = user.gets.chomp
                    if Board.cases[choice].is_empty
                        state = "O"
                        choice_is_valid= true
                    else 
                        puts "Wrong choice mate nb 2, try that again"
                    end
                end
            end

            Board.show
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
        [1,3].each { |n|
            if @board.cases[n].state == "X" && @board.cases[n + 4].state == "X" && @board.cases[n + 8].state == "X"
                return @player1
            elsif @board.cases[n].state == "O" && @board.cases[n + 4].state == "O" && @board.cases[n + 8].state == "O"
                return @player2
            end      
        }
    end

end

class Board
    attr_accessor :cases
    def initialize
        @cases = [0, BoardCase.new(1," "), BoardCase.new(2," "), BoardCase.new(3," "), BoardCase.new(4," "), BoardCase.new(5," "), BoardCase.new(6," "), BoardCase.new(7," "), BoardCase.new(8," "), BoardCase.new(9," ")]
    end

    def show
        puts @cases[1].state.to_s + " | " + @cases[2].state.to_s + " | " + @cases[3].state.to_s
        puts @cases[4].state.to_s + " | " + @cases[5].state.to_s + " | " + @cases[6].state.to_s
        puts @cases[7].state.to_s + " | " + @cases[8].state.to_s + " | " + @cases[9].state.to_s
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
#my_game.play()

=begin

my_board = Board.new()
my_board.cases[1].state="X"
my_board.cases[3].state="X"
my_board.cases[7].state="O"
my_board.cases[8].state="O"

my_board.show

my_board.reset

my_board.show

=end



