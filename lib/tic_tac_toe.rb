class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
   WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]
     ]
     
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(move)
    index = move.to_i - 1
    index  
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end 
  
  def valid_move?(index)
      if index.between?(0,8) && !position_taken?(index)
        return true 
      else 
        return false
      end 
  end 
  
  def turn
    puts "Please choose a position  between 1-9"
    #player_choice
    player_choice = gets.strip
    index = input_to_index(player_choice)
    token = current_player
    
    if valid_move?(index)
      move(index, token)
      display_board
    else 
      puts "move is invalid, try again"
      turn
    end 
  end
      
  def won? 
    
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&
      @board[winner[1]] == @board[winner[2]] &&
      (@board[winner[0]] == "X" || @board[winner[0]] == "O")
    end 
    
    #not sure why above code works
  
    # intersection = (@board & WIN_COMBINATIONS)
    # if @board.any? == WIN_COMBINATIONS.any?
    #   return false
    # else 
    #   intersection
    # end 
  end 
  
  def full?
    #thank you stackoverflow 
    #learned today that you can have an array of boolean values
    boolean_array = []
    @board.each do |token|
        if token == "X" || token == "O"
        boolean_array << true
        else
        boolean_array << false
        end
    end
    boolean_array.all?
  end 
  
  def draw? 
    full? && !won?
  end 
  
  def over? 
    won? || draw?
  end 
  
  def winner
    if winning_combo = won?
      @winner = @board[winning_combo.first]
  end 
end

def play 
  
  until over? do 
    turn
  end 
  
  if won? 
    puts "Congratulations #{winner}!"
  elsif draw? 
    puts "Cat's Game!"
  end
end 
#   until var == 11 do
  
#   # code to be executed 
#   puts var * 10
#   var = var + 1
    
# # here loop ends 

end