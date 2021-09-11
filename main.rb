# frozen_string_literal: true

require 'pry'

# creates GameBoard class to initiate a tic-tac-toe board
class Board
  def initialize
    @gameboard = []
  end

  def add_gameboard_rows
    i = 0
    while i < 3
      @gameboard.push(['[ ]', '[ ]', '[ ]'])
      i += 1
    end
  end

  def display_board
    # puts played_board.class
    @gameboard = @gameboard.each do |x|
      puts x.join('')
    end
  end

  def cats_game(game)
    cats_result = []
    game.each do |x|
      if x.include?('[ ]')
        cats_result.push('play')
      else
        cats_result.push('cats')
      end
    end
    puts "Cat's Game!" if cats_result.all?('cats')
  end

  def continue_game(gameboard)
    nested_array_result = []
    gameboard.each do |x|
      if x.include?('[ ]')
        nested_array_result.push('play on!')
      else
        nested_array_result.push("cat's game!")
      end
    end
    nested_array_result
  end
end

# Class that does game play moves
class PlayGame < Board
  def position_x_check(move)
    return unless @gameboard[move[0]][move[1]] != '[ ]'

    puts 'Chose again! Spot already taken!'
    display_board
    position_x
  end

  def position_o_check(move)
    return unless @gameboard[move[0]][move[1]] != '[ ]'

    puts 'Chose again! Spot already taken!'
    display_board
    position_o
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

# Class that executes game play moves
class GamePlay < PlayGame
  def add_x
    display_board
    position_x
  end

  def add_o
    display_board
    position_o
  end

  def add_x_o
    while continue_game(@gameboard).all?("cat's game!") == false
      add_x
      check_winner(@gameboard)
      if continue_game(@gameboard).all?("cat's game!") == true
        display_board
        return cats_game(@gameboard)
      end

      add_o
      check_winner(@gameboard)
      if continue_game(@gameboard).all?("cat's game!") == true
        display_board
        return cats_game(@gameboard)
      end
    end
  end

  def row_win_x(game)
    (0..2).each do |i|
      next unless game[i][0] == ' x ' && game[i][1] == ' x ' && game[i][2] == ' x '

      display_board
      puts 'player_X won the game!!'
      exit
    end
  end

  def row_win_o(game)
    (0..2).each do |i|
      next unless game[i][0] == ' o ' && game[i][1] == ' o ' && game[i][2] == ' o '

      display_board
      puts 'player_O won the game!!'
      exit
    end
  end

  def column_win(game)
    (0..2).each do |i|
      if game[0][i] == ' x ' && game[1][i] == ' x ' && game[2][i] == ' x '
        display_board
        puts 'player_X won the game!!'
        exit
      end
      next unless game[0][i] == ' o ' && game[1][i] == ' o ' && game[2][i] == ' o '

      display_board
      puts 'player_O won the game!!'
      exit
    end
  end

  def cross_win_x_left(game)
    return unless game[0][0] == ' x ' && game[1][1] == ' x ' && game[2][2] == ' x '

    display_board
    puts 'player_X won the game!!'
    exit
  end

  def cross_win_x_right(game)
    return unless game[2][0] == ' x ' && game[1][1] == ' x ' && game[0][2] == ' x '

    display_board
    puts 'player_X won the game!!'
    exit
  end

  def cross_win_o_left(game)
    if game[0][0] == ' o ' && game[1][1] == ' o ' && game[2][2] == ' o '
      display_board
      puts 'player_O won the game!!'
      exit
    end
  end

  def cross_win_o_right(game)
    if game[2][0] == ' o ' && game[1][1] == ' o ' && game[0][2] == ' o '
      display_board
      puts 'player_O won the game!!'
      exit
    end
  end

  def check_winner(game)
    row_win_x(game)
    row_win_o(game)
    column_win(game)
    cross_win_x_left(game)
    cross_win_x_right(game)
    cross_win_o_left(game)
    cross_win_o_right(game)
  end
end

second_board = GamePlay.new
second_board.add_gameboard_rows
second_board.add_x_o
