

class Game

  attr_accessor :board, :player_1, :player_2


  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

 
  def initialize(player_1=Players::Human.new("X") , player_2=Players::Human.new("O"), board=Board.new) #accepts 2 players and a board
    #defaullts to two HUMAN players, X and O, with and empty board
    #how to default player to human? Create!! a Human player with a token that's X and 
    # the other is O
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
    
  end
    def over?
    board.full?
  end

  def won? #review!
    result = ""
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        result = true
        @winner = "X"
        break
      elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        result = true
        @winner = "O"
        break
      else
        result = false
      end 
    end 
    result
  end

  def draw?
    won? == false && over? == true 
  end

  def winner
    @winner if won?
  end

  def turn
    current_move = current_player.move(board)
      while board.valid_move?(current_move) == false
        current_move = current_player.move(board)
      end 
    board.update(current_move, current_player) 
  end 

  def play
    until won? || draw? 
      turn 
    end 
    puts "Congratulations #{winner}!" if won? 
    puts "Cats Game!" if draw? 
  end

  #_________________________________________________________

#   def over?
#     board.full?
#     #what if somebody wins ahead? and the board isnt full
   
#   end

#   def won?
#     # @winner if won?
#     return true if winner
#     return false 
#   end

#   def draw?
#     if board.full? && winner == nil
#       return true
#     end
#     # return true if board.full && !won?
#     # return false
#   end

  

#   def winner
#     player_1_board = []
#     player_2_board = []

#     board.cells.each_with_index do |cell, index|
#       player_1_board << index if @player_1.token == cell
#       player_2_board << index if @player_2.token == cell
#     end

#     if WIN_COMBINATIONS.find{|winning_array| winning_array - player_1_board == []}
#       return @player_1.token
#     elsif WIN_COMBINATIONS.find{|winning_array| winning_array - player_2_board == []}
#       return @player_2.token
#     end
#     return nil
#   end




#   def play #Krissa
#    until won? || draw? 
#      # display.board 
#      board.display
#      turn 
#    end 
#    puts "Congratulations #{winner}!" if won? 
#    puts "Cats Game!" if draw? 
#  end




# def turn #Rebecca
#    current_move = current_player.move(board)
#      while board.valid_move?(current_move) == false
#        current_move = current_player.move(board)
#      end 
#    board.update(current_move, current_player) 
#  end

#    # def turn #review! Krissa
#   #   current_move = current_player.move(self.board) until self.board.valid_move?(current_move.to_i)  
#   #   self.board.update(current_move.to_i,current_player) #think further
#   # end

#    # def turn -Nikki
#  #    move_choice = current_player.move(board) until board.valid_move?(move_choice.to_i)
#  #    board.update(move_choice.to_i, current_player)
#  #  end
#__________________________________________________________


end