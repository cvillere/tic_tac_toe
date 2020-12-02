# frozen_string_literal: true

# creates GameBoard class to initiate a tic-tac-toe board
class GameBoard
  attr_accessor :make_gameboard

  def initialize(make_gameboard)
    @make_gameboard = make_gameboard
  end

  def position_x_check(move)
    if @make_gameboard[move[0]][move[1]] != "[ ]"
      puts 'Chose again! Spot already taken!'
      display_board
      position_x
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
    @make_gameboard[play[0]][play[1]] = ' o '
  end

  def display_board
    # puts played_board.class
    @make_gameboard = @make_gameboard.each | x |
      puts x.join('')
  end

end

# This class executes the game
class PlayGame
  attr_accessor :board

  def initialize(board)
    @board = board
  end

=begin
  def continue_game gameboard
    nested_array_result = []
    puts gameboard
    gameboard.each {|x|
      if x.include?("[ ]") == true
        nested_array_result.push(true)
      end
    }
      if nested_array_result.any?(true)
        return true
      else
        return false
      end
  end
=end

  def play_game(game)
    while continue_game(game).include?('[ ]') == true do
      winner(game)
      cats_game(game)
      game.display_board
      game.position_x
      game.display_board
      winner(game)
      cats_game(game)
      game.position_y
      game.display_board
      winner(game)
      cats_game(game)
    end
  end

  private

  def cats_game(game_board)
    nested_array_result = []
    game_board.each | x |
      if x.include?('[ ]') == false
        nested_array_result.push(true)
      end
    
    if nested_array_result.all?(true)
      puts "cat's game!"
    end
  end

  def winner(game)
    for i in 1..3
      if game[i][1] && game[i][2] && game[i][3] == 'x'
        puts 'player_one won the game!!'
      end
      if game[i][1] && game[i][2] && game[i][3] == 'o'
        puts 'player_two won the game!!'
      end
    end
    for i in 1..3
      if game[1][i] && game[2][i] && game[3][i] == 'x'
        puts 'player_one won the game!!'
      end
      if game[1][i] && game[2][i] && game[3][i] == 'o'
        puts 'player_two won the game!!'
      end
    end
    for i in 1..3
      if game[i][i] && game[i][i] && game[i][i] == 'x'
        puts 'player_one won the game!!'
      end
      if game[i][i] && game[i][i] && game[i][i] == 'o'
        puts 'player_two won the game!!'
      end
    end

    if game[3][1] && game[2][2] && game[1][3] == 'x'
      puts 'player_one won the game!!'
    end
    if game[3][1] && game[2][2] && game[1][3] == 'o'
      puts 'player_two won the game!!'
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
