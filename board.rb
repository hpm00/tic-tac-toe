# Create Board 
class Board
    attr_reader :cells
    
    WINNINGS_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], 
                    [2, 5, 8], [0, 4, 8], [2, 4, 6]] #all possible winning combos
  
    def initialize
      @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def display_board
      puts <<-HEREDOC
         #{cells[0]} | #{cells[1]} | #{cells[2]}
        ---+---+---
         #{cells[3]} | #{cells[4]} | #{cells[5]}
        ---+---+---
         #{cells[6]} | #{cells[7]} | #{cells[8]}
      HEREDOC
    end
  
    def update_board(number, character)
      @cells[number - 1] = character #why isn't this number - 1 ?
    end 
  
    def move_allowed?
      @cells[number - 1] == number # did it change with @cells or leave as cells; bottom as well
    end
  
    def full_board?
      @cells.all? { |cell| cell =~ /[^0-9]/} # (=~): if string == expression, returns index : nil
    end
  
    def game_over?
      WINNINGS_COMBOS.any? do |combo|
        [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1 
        # [X,X,X].uniq --> [X].length --> 1 {winner}
        # [X,X,O].uniq --> [X, O].length --> 2 
      end
    end
end 