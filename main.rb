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

  def move_player_x(game_board)
    puts 'Player 1: Where would you like to put "x"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    check_move_x(game_board, play)
  end

  def check_move_x(game_board, move_spot)
    if game_board[move_spot[0]][move_spot[1]] != ' '
      puts 'Chose again! Spot already taken!'
    else
      game_board[move_spot[0]][move_spot[1]] = ' x '
    end
    display_board(game_board)
  end
end

new_board = Board.new([['[ ]', '[ ]', '[ ]'],
                       ['[ ]', '[ ]', '[ ]'],
                       ['[ ]', '[ ]', '[ ]']])
new_board.display_board()
new_board.move_player_x(@game_board)
