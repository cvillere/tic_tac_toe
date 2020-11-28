class GameBoard
  

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def gameboard()
    @gameboard = [["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"],
                 ["[ ]", "[ ]", "[ ]"]]
    return @gameboard   
  end


  def display_gameboard played_board
    puts played_board.class
    played_board = played_board.each {|x| 
      puts x.join(" ")
    }
  end
end


game = GameBoard.new("gameboard")
game.display_gameboard(game.gameboard())