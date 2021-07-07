require "pry"
class TicTacToe
    WIN_COMBINATIONS=[ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    attr_accessor :board
    
    def initialize(board:[" "," "," "," "," "," "," "," "," "])
      @board=board
    end
    
    def display_board
     puts output=[" #{@board[0]} | #{@board[1]} | #{@board[2]} ", "-----------", " #{@board[3]} | #{@board[4]} | #{@board[5]} ", "-----------", " #{@board[6]} | #{@board[7]} | #{@board[8]} ", "-----------"]
    end

    
    def input_to_index(st)
      st.to_i-1
    end

    def move(index, token="X")
      @board[index]=token
    end
    
    def position_taken?(index)
       @board[index] !=" "
    end
  
    def valid_move?(index)
       range=(0..8)
       (@board[index] == " ") && (range.include?(index))
    end

    def turn_count
        return @board.count { |x| x !=" " }
    end
    def current_player
        a=@board.count { |x| x !="X" }
        b=@board.count { |x| x !="O" }
        if a>=b
            return "X"
        else
            return "O"
        end
    end

    def turn
        indes = gets.chomp
        a=self.input_to_index(indes)
       if self.valid_move?(a)
        board[a]=self.current_player
        display_board
       else
        turn
       end
    end
 #binding pry
    def won?
        indes=@board.each_with_index.map { |a, i| a == "X" ? i : nil }.compact
        result=WIN_COMBINATIONS.find do |m|
            (m & indes) == m
       end
       return result
    end

    def full?
        (if board.any? {|m| m ==" "}
        false
        end)
    end

    def draw?
    end
    def over?
    end
    def winner
    end
    def play 
    end
  end