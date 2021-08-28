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
    @first_row = []
    @second_row = []
    @third_row = []
    @game_board = [@first_row,
                   @second_row,
                   @third_row]
  end
  def display_board game_board
    p game_board
  end

  def move_player_x game_board
  end
end