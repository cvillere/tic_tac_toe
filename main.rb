class GameBoard
  attr_accessor :make_gameboard

  def initialize(make_gameboard)
    @make_gameboard = make_gameboard

  end

  def make_gameboard
    @make_gameboard
  end

  def position_x_check move
    if @make_gameboard[move[0]][move[1]] != "[ ]"
      puts "Chose again! Spot already taken!"
      display_board
      get_position_x
    end
  end

  def position_y_check move
    if @make_gameboard[move[0]][move[1]] != "[ ]"
      puts "Chose again! Spot already taken!"
      display_board
      get_position_y
    end
  end

  def get_position_x
    puts "Player 1: Where would you like to put 'x'?"
    puts "Row?"
    puts "Column?"
    row = gets.to_i
    column = gets.to_i
    row = row - 1
    column = column - 1
    play = [row, column]
    @make_gameboard[play[0]][play[1]] = " x "
  end

  def get_position_y
    puts "Player 2: Where would you like to put 'o'?"
    puts "Row?"
    puts "Column?"
    row = gets.to_i
    column = gets.to_i
    row = row - 1
    column = column - 1
    play = [row, column]
    @make_gameboard[play[0]][play[1]] = " o "
  end


  def display_make_gameboard played_board
    #puts played_board.class
    played_board = played_board.each {|x| 
      puts x.join("")
    }
  end
end



=begin
class GamePlayers

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  public

  def player_one(board)
    puts "Player 1: Where would you like to put 'x'?"
    puts "Row?"
    puts "Column?"
    row = gets.to_i
    column = gets.to_i
    row = row - 1
    column = column - 1
    play = [row, column]
    board.change_make_gameboard_x(play)
    board.display_make_gameboard(board.make_gameboard)
  end

  def player_two(board)
    puts "Player 2: Where would you like to put 'o'?"
    puts "Row?"
    puts "Column?"
    row = gets.to_i
    column = gets.to_i
    row = row - 1
    column = column - 1
    play = [row, column]
    board[play[0]][play[1]] = "o"
    board
  end
end
=end
