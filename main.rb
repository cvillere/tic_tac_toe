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

class Board
  attr_accessor :first_row, :second_row, :third_row, 
  :game_board

  def initialize first_row, second_row, third_row, game_board
    @first_row = [' ', ' ', ' ']
    @second_row = [' ', ' ', ' ']
    @third_row = [' ', ' ', ' ']
    @game_board = [@first_row,
                   @second_row,
                   @third_row]
  end

  def display_board(game_board)
    p game_board
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
    if @game_board[play[0]][play[1]] != ' ' 
      puts 'Chose again! Spot already taken!'
    else
      @game_board[play[0]][play[1]] = ' x '
  end

end