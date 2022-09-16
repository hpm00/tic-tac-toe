require_relative 'display.rb'
require_relative 'board.rb'
require_relative 'player.rb'

class Game
  include Display
  @@first_character = ''

  def initialize
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def play
    game_set_up
    @board.display_board
    player_turns
    conclusion
  end

  def conclusion
    if @board.identify_winner
      announce_winner(@current_player.name)
      restart
    elsif @board.full_board?
      puts announce_draw
      restart
    end
  end

  def restart
    input = gets.chomp.downcase
    if input == 'y'
      Game.new.play
    else
      puts over
    end
  end
  
  def player_turns
    until @board.full_board? do
      turn
      number = gets.chomp.to_i 
      @board.valid_move?(number) ? @board.update_board(number, @current_player.character) : invalid_number
      break if @board.identify_winner
    end
  end

  def invalid_number
    puts invalid_input
    @current_player = @current_player == @first_player ? @second_player : @first_player
  end
      
  def turn
    @current_player = @current_player == @first_player ? @second_player : @first_player
    puts ask_player_turn(@current_player.name, @current_player.character)
  end

  
  def game_set_up
    puts display_intro
    @first_player = create_player(1)
    @second_player = create_player(2)
  end

  def create_player(number)
    puts ask_player_name(number)
    name = gets.chomp
    character = valid_character? if number == 1
    character = second_character if number == 2
    Player.new(name, character)
  end

  def second_character
    character = ''
    character = @@first_character == 'X' ? 'O' : 'X'
    puts "Your opponent chose '#{@@first_character}'. You are '#{character}'."
    character
  end

  def valid_character?
    character = ''
    loop do
      puts ask_player_character
      character = gets.chomp.upcase
      break if character == 'X' || character == 'O'

      puts invalid_input
    end
    @@first_character = character
  end
end

Game.new.play