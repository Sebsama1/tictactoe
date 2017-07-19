class Player
    attr_accessor :name
    def initialize(name)
        @name = name
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
                ## Initialisation du plateau
        board = Board.new
        board.play
        board.show
        puts @player1.name + " choose where to play : case 1, 2, 3, 4, 5, 6, 7, 8, 9"
        choice = gets.chomp
        case choice
        when 1
            @case1.state = "X"
        end
        puts @case1.state
        board.show

    end
end

class Board
    def initialize
        @case1 = BoardCase.new("case1"," ")
        @case2 = BoardCase.new("case2"," ")
        @case3 = BoardCase.new("case3"," ")
        @case4 = BoardCase.new("case4"," ")
        @case5 = BoardCase.new("case5"," ")
        @case6 = BoardCase.new("case6"," ")
        @case7 = BoardCase.new("case7"," ")
        @case8 = BoardCase.new("case8"," ")
        @case9 = BoardCase.new("case9"," ")
    end
    def show
        puts @case1.state + " | " + @case2.state + " | " + @case3.state
        puts @case4.state + " | " + @case5.state + " | " + @case6.state
        puts @case7.state + " | " + @case8.state + " | " + @case9.state
    end
    def play

    end
end

class BoardCase
    attr_accessor :name, :state
    def initialize(name, state)
        @name = name
        @state = state
    end


end

game1 = Game.new
