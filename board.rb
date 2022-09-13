class Board 
    WINNINGS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
    def initialize
      @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def display_board
      puts <<-BOARD
  
      #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      --+---+--
      #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      --+---+--
      #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
  
      BOARD
    end
  
    def update_board(number, character)
      @cells[number - 1] = character
      display_board ## do we need?
    end
  
    def valid_move?(number)
      @cells[number - 1] == number
    end
  
    def full_board?
      @cells.all? { |cell| cell =~ /[^0-9]/} # (=~): matches regex to string 
    end
  
    def identify_winner
      WINNINGS.any? do |combo|
        [@cells[combo[0]], @cells[combo[1]], @cells[combo[2]]].uniq.length == 1
      end
    end
end

  # [X,X,X].uniq --> [X].length --> 1 {winner}
  # [X,X,O].uniq --> [X, O].length --> 2 
  
  # board = Board.new
  # board.display_board
  # board.update_board(8, "X")
  # board.update_board(9, "X")
  # board.update_board(7, "X")
  # puts board.valid_move?(8)
  # puts board.identify_winner