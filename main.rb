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
  attr_accessor :game_board

  def initialize(game_board)
    @game_board = game_board
  end

  def display_board
    # puts played_board.class
    @game_board = @game_board.each{| x |
      puts x.join('')
    }
  end

  def move_player_x
    puts 'Player X: Where would you like to put "x"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    check_move_x(@game_board, play)
  end

  def check_move_x(game_board, move_spot)
    if game_board[move_spot[0]][move_spot[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
    else
      game_board[move_spot[0]][move_spot[1]] = ' x '
    end
    display_board()
  end

  def move_player_o
    puts 'Player O: Where would you like to put "o"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    check_move_o(@game_board, play)
  end

  def check_move_o(game_board, move_spot)
    if game_board[move_spot[0]][move_spot[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
    else
      game_board[move_spot[0]][move_spot[1]] = ' o '
    end
    display_board()
  end

end

class PlayGame < Board

  def game_play
    while @game_board.include?('[ ]')
      Board.display_board()
      Board.move_player_x()
      Board.move_player_o()
      winner(@game_board)
    end


  def winner(game)
    for i in 0..2 do
      if game[i][0] == ' x ' && game[i][1] == ' x ' && game[i][2] == ' x '
        return 'player_x won the game!!'
      end
      if game[i][0] == ' o ' && game[i][1] == ' o ' && game[i][2] == ' o '
        return 'player_o won the game!!'
      end
    end
    for i in 0..2 do
      if game[0][i] == ' x ' && game[1][i] == ' x ' && game[2][i] == ' x '
        return 'player_x won the game!!'
      end
      if game[0][i] == ' o ' && game[1][i] == ' o ' && game[2][i] == ' o '
        return 'player_o won the game!!'
      end
    end
      if game[0][0] == ' x ' && game[1][1] == ' x ' && game[2][2] == ' x '
        return 'player_x won the game!!'
      end 
      if game[0][0] == ' o ' && game[1][1] == ' o ' && game[2][2] == ' o '
        return 'player_o won the game!!'
      end
      if game[2][0] == ' x ' && game[1][1] = ' x ' && game[0][2] == ' x '
        return 'player_x won the game!!'
      end
      if game[2][0] == ' o ' && game[1][1] == ' o ' && game[0][2] == ' o '
        return 'player_o won the game!!'
      end
    end
end


new_board = Board.new([['[ ]', '[ ]', '[ ]'],
                       ['[ ]', '[ ]', '[ ]'],
                       ['[ ]', '[ ]', '[ ]']])

game = PlayGame.new(new_board)
game.game_play
