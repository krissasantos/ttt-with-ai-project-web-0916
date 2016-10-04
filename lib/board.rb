class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #sets a board to a 9 element string array
    

  end



  def reset!
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #sets a board to a 9 element string array
    @cells = Array.new(9, " ")
  end

  def display
    
    

    puts " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "

    
    # a cleaner way! but fix spacing!
    # puts cells.each_slice(3).map { |row| row.join(" | ") }.join("\n"+ "-----------"+ "\n")

  end

  def position(user_input) #where do i gert the value of the board cell?
    @cells[user_input.to_i - 1]

     # takes in user input and returns the value of the board cell (FAILED - 1)
  end

  def full?
    @cells.all? {|c| c == "X" || c == "O"} ? true : false
  
  end

  def turn_count
    9 - @cells.select {|c| c == " "}.size
  end

  def taken?(cell_position)

      @cells[cell_position.to_i - 1] != " " ? true : false #Rebecca

    # return true if @cells[cell_position.to_i - 1] == "X" || @cells[cell_position.to_i - 1] == "O"
    # return false
    
  end

  def valid_move?(cell_position)

    taken?(cell_position) == false && cell_position.to_i.between?(1,9) #Rebecca
    # positions = (1..9).to_a
    # return true if positions.include?(cell_position.to_i) && @cells[cell_position.to_i - 1] == " " 
    # return false
  end

  def update(cell_position, player)
    @cells[cell_position.to_i - 1] = player.token
  end
end
