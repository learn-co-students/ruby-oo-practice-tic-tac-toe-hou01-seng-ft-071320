require 'pry'

class TicTacToe
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
    end

    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, x_or_o = X)
        @board[index] = x_or_o
    end

    def position_taken?(input)
        if @board[input] == "O" || @board[input] == "X"
            return true
        else
            return false
        end
    end

    def valid_move?(input)
        if input >= 0  && input < 9 && position_taken?(input) == false
            return true
        else 
            return false
        end
    end

    def turn
        puts "Specify a position between 1 and 9: "
        user_in = gets.chomp
         x = input_to_index(user_in)
        #binding.pry
        if valid_move?(x) == true
            @board[x] = current_player
        else
            puts "Move is not valid. Try again."
            turn
        end
        display_board
    end 

    def turn_count
        empty = @board.select do |m|
            m == " "
        end
        x = 9 - empty.count
    end

    def current_player
        if turn_count.odd?
            return "O"
        end
        return "X"
    end

    def won?
        any_wins = []
        WIN_COMBINATIONS.each do |m|
            x = []
            m.each do |n|
                if n != nil
                    x << @board[n]
                end
            end
            if x == ["X", "X", "X"] || x == ["O", "O", "O"]
                return m.flatten
            end
        end
        false
    end

    def full?
        if @board.include?(" ")
            return false
        else
            return true
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
        if draw? == true 
            return true
        elsif won?
            return true
        else
            return false
        end
    end

    def winner
        if over? == true
            if current_player == "X"
                puts "Congratulations O!"
                return "O"
            else
                puts "Congratulations X!"
                return "X"
            end
        end
    end

    def play
        while over? == false do
            draw?
            turn






            
        end
        if draw? == true
            puts "Cat's Game!"
        else
            winner
        end
    end


end


# x = TicTacToe.new
# x.play

