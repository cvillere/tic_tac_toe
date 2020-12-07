# frozen_string_literal: true
require 'pry'
# creates GameBoard class to initiate a tic-tac-toe board
class GameBoard
  attr_accessor :make_gameboard

  def initialize(make_gameboard)
    @make_gameboard = make_gameboard
  end

  def position_x_check(move)
    if @make_gameboard[move[0]][move[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
      display_board
      position_x
    end
  end

  def position_y_check(move)
    if @make_gameboard[move[0]][move[1]] != '[ ]'
      puts 'Chose again! Spot already taken!'
      display_board
      position_y
    end
  end

  def position_x
    puts 'Player 1: Where would you like to put "x"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    position_x_check(play)
    @make_gameboard[play[0]][play[1]] = ' x '
  end

  def position_y
    puts 'Player 2: Where would you like to put "o"?'
    puts 'Row?'
    puts 'Column?'
    row = gets.to_i
    column = gets.to_i
    row -= 1
    column -= 1
    play = [row, column]
    position_y_check(play)
    @make_gameboard[play[0]][play[1]] = ' o '
  end

  def display_board
    # puts played_board.class
    @make_gameboard = @make_gameboard.each{| x |
      puts x.join('')
    }
  end
end

# This class executes the game
class PlayGame
  attr_accessor :board

  def initialize(board)
    @board = board
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

  def play_game
    while continue_game(@board.make_gameboard).include?("play on!") do
      @board.display_board
      @board.position_x
      @board.display_board
      if winner(@board.make_gameboard) == 'player_one won the game!!' || 
         winner(@board.make_gameboard) == 'player_two won the game!!'
         puts winner(@board.make_gameboard)  
        break
      end
      if cats_game(@board.make_gameboard) == "cats game!"
        puts cats_game(@board.make_gameboard)
        break
      end
      @board.position_y
      if winner(@board.make_gameboard) == 'player_one won the game!!' || 
        winner(@board.make_gameboard) == 'player_two won the game!!'
        puts winner(@board.make_gameboard)
        break
      end
      if cats_game(@board.make_gameboard) == "cats game!"
        puts cats_game(@board.make_gameboard)
        break
      end
    end
  end

  private

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
      return "cats game!"
    end
  end

  def winner(game)
    for i in 0..2 do
      if game[i][0] == ' x ' && game[i][1] == ' x ' && game[i][2] == ' x '
        return 'player_one won the game!!'
      end
      if game[i][0] == ' o ' && game[i][1] == ' o ' && game[i][2] == ' o '
        return 'player_two won the game!!'
      end
    end
    for i in 0..2 do
      if game[0][i] == ' x ' && game[1][i] == ' x ' && game[2][i] == ' x '
        return 'player_one won the game!!'
      end
      if game[0][i] == ' o ' && game[1][i] == ' o ' && game[2][i] == ' o '
        return 'player_two won the game!!'
      end
    end

    if game[0][0] == ' x ' && game[1][1] == ' x ' && game[2][2] == ' x '
      return 'player_one won the game!!'
    end 
    if game[0][0] == ' o ' && game[1][1] == ' o ' && game[2][2] == ' o '
      return 'player_two won the game!!'
    end
  
    if game[2][0] == ' x ' && game[1][1] = ' x ' && game[0][2] == ' x '
      return 'player_one won the game!!'
    end
    if game[2][0] == ' o ' && game[1][1] == ' o ' && game[0][2] == ' o '
      return 'player_two won the game!!'
    end
  end
end

initial_board = GameBoard.new([['[ ]', '[ ]', '[ ]'],
                               ['[ ]', '[ ]', '[ ]'],
                               ['[ ]', '[ ]', '[ ]']])

game = PlayGame.new(initial_board)
game.play_game

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
