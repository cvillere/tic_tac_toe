class GameBoard
  attr_accessor :gameboard

  def initialize()
    @gameboard = [["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"]] 
  end


  def display_gameboard played_board
    puts played_board.class
    played_board = played_board.each {|x| 
      puts x.join(" ")
    }
  end
end


game = GameBoard.new()
game.display_gameboard(gameboard)