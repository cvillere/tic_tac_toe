class GameBoard
  

  def initialize(gameboard)
    @gameboard = gameboard

  end

  def gameboard
    @gameboard = [["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"]]
    return @gameboard   
  end

=begin
  def x
    return @x
  end

  def o
    return @o
  end
=end

  def display_gameboard played_board
    #puts played_board.class
    played_board = played_board.each {|x| 
      puts x.join(" ")
    }
  end
end


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
    board.gameboard[play[0]][play[1]] = "x"
    puts board.gameboard.class
    puts board.gameboard[play[0]][play[1]]
    board.display_gameboard(board.gameboard)
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

game = GameBoard.new("gameboard")
players = GamePlayers.new("player_1", "player_2")
#game.display_gameboard(game.gameboard())
players.player_one(game)
#game.display_gameboard(game.gameboard())