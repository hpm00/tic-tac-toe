# create round of the game 
class Game
    include Display
    attr_reader :board
    
    def initialize
      @board = Board.new
      @game_over = false
    end
end