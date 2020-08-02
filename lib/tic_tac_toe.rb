require 'pry'

class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
    end

    WIN_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    def board
        puts "#{@board[0]}#{@board[1]}#{@board[2]}"
        puts "#{@board[3]}#{@board[4]}#{@board[5]}"
        puts "#{@board[6]}#{@board[7]}#{@board[8]}"

    end

    def input_to_index
        my_input = gets.chomp
        my_input = my_input.to_i -1
    end

    def move(index, x_or_o = X)
        @board[index] = x_or_o
    end

    def position_taken?(input)
        if board[input] == "O" || board[input] == "X"
            return false
        else
            return true
        end
    end

    def vaild_move?(input)
        if input < 0 && input > 10 && position_taken?(input) == true
            return true
        else 
            return false
        end
    end

    def turn
        puts "Specify a position between 1 and 9: "
        input_to_index
        if vaild_move?(input_to_index) == true
            @board[input_to_index] =  current_player
        else
            puts "Move is not valid. Try again."
            turn
        end
    end 

    def turn_count
        empty = @board.select do |m|
            m == " "
        end
        x = 10 - empty.count
    end

    def current_player
        if even?(turncount)
            return "X"
        end
        return "O"
    end

    def won?
        any_wins = []
        WIN_COMBINATIONS.each do |m|
            x = []
            m.each do |n|
                if n != nil
                    x << @board[n]
                    binding.pry
                end
            end
            if x == ["X", "X", "X"] || x == ["O", "O", "O"]
                return true
            end
        end
        false
    end

    def full?
        x = @board.find{ |m| " "}
        if  x == nil
            return true
        else
            return false
        end
    end

    def draw?
        if full? == true && won? == false
            return true
        else
            return false
        end
    end

    def over?
        if draw? == true || won? == true
            reutrn true
        else
            return false
        end
    end

    def winner
        if over? == true
            puts "#{current_player} has won the game."
        end
    end

    def play
        while over? == false do
            board
            turn






            
        end
        if draw? == true
            puts "This game ended in a draw."
        else
            winner
        end
    end


end


x = TicTacToe.new
@board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
x.play

