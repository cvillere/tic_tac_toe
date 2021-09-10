=begin
instance method
----Making a playerX move
----Making a playerY move
----Displaying the gameboard

class
----the board

instance variable
----1st row of the board
----2nd row of the board
----3rd row of the board
=end

# frozen_string_literal: true

require 'pry'
# creates GameBoard class to initiate a tic-tac-toe board
class Board


  def initialize
    @gameboard = []
  end

  def add_gameboard_rows
    i = 0
    while i < 3 do
      @gameboard.push(['[ ]', '[ ]', '[ ]'])
      i += 1
    end
  end

  def display_board
    # puts played_board.class
    @gameboard = @gameboard.each{| x |
      puts x.join('')
    }
    # @gameboard
  end

  def cats_game(game)
    cats_result = []
    game.each { | x |
      if x.include?('[ ]')
        cats_result.push("play")
      else
        cats_result.push("cats")
      end
      }
    if cats_result.all?("cats")
      puts "Cat's Game!"
      return "Cat's Game!"
    end
  end

  def continue_game gameboard
    nested_array_result = []
    gameboard.each {|x|
      if x.include?("[ ]")
        nested_array_result.push("play on!")
      else
        nested_array_result.push("cat's game!")
      end
    }
    return nested_array_result
  end

end

class PlayGame < Board

  def position_x_check(move)
    if @gameboard[move[0]][move[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
      display_board
      position_x
    end
  end

  def position_o_check(move)
    if @gameboard[move[0]][move[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
      display_board
      position_o
    end
  end

  def position_x
    puts 'Player X: Where would you like to put "x"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    position_x_check(play)
    @gameboard[play[0]][play[1]] = ' x '
  end

  def position_o
    puts 'Player O: Where would you like to put "o"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    position_o_check(play)
    @gameboard[play[0]][play[1]] = ' o '
  end
end

class GamePlay < PlayGame

  def add_x
    display_board()
    position_x()
  end

  def add_o
    display_board()
    position_o()
  end

  def add_x_o
    while continue_game(@gameboard).all?("cat's game!") == false do
      add_x()
      if continue_game(@gameboard).all?("cat's game!") == true
        display_board()
        check_winner(@gameboard)
        return cats_game(@gameboard)
      end

      add_o()
      if continue_game(@gameboard).all?("cat's game!") == true
        display_board()
        check_winner(@gameboard)
        return cats_game(@gameboard)
      end
    end
  end

  def row_win(game)
    for i in 0..2 do
      if game[i][0] == ' x ' && game[i][1] == ' x ' && game[i][2] == ' x '
        return 'player_one won the game!!'
      end
      if game[i][0] == ' o ' && game[i][1] == ' o ' && game[i][2] == ' o '
        return 'player_two won the game!!'
      end
    end

  def column_win(game)
    for i in 0..2 do
      if game[0][i] == ' x ' && game[1][i] == ' x ' && game[2][i] == ' x '
        return 'player_one won the game!!'
      end
      if game[0][i] == ' o ' && game[1][i] == ' o ' && game[2][i] == ' o '
        return 'player_two won the game!!'
      end
    end
  end
  
  def cross_win(game)
    if game[0][0] == ' x ' && game[1][1] == ' x ' && game[2][2] == ' x '
      return 'player_X won the game!!'
    end 
    if game[0][0] == ' o ' && game[1][1] == ' o ' && game[2][2] == ' o '
      return 'player_O won the game!!'
    end
    if game[2][0] == ' x ' && game[1][1] = ' x ' && game[0][2] == ' x '
      return 'player_X won the game!!'
    end
    if game[2][0] == ' o ' && game[1][1] == ' o ' && game[0][2] == ' o '
      return 'player_O won the game!!'
    end
  end

  def check_winner(game)
    row_win(game)
    column_win(game)
    cross_win(game)
  end

end

=begin
new_board = Board.new()
new_board.add_gameboard_rows
new_board.display_board
=end

second_board = GamePlay.new
second_board.add_gameboard_rows
second_board.add_x_o