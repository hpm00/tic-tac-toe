module Display
    def display_intro
      puts "Let's play Tic-Tac-Toe!"
    end 
    
    def ask_player_name(number)
      puts "What is the name of Player ##{number}?"
    end
    
    def ask_player_character
      puts "What do you prefer: 'X' or 'O'?"
    end
  
    def display_character(selected_character, default_character)
      puts "Your opponent chose '#{selected_character}'. You are '#{default_character}'."
    end 
  
    def ask_player_turn(name, character)
      puts "#{name}, please enter a number (1-9). I will place your '#{character}' 
      on the corresponding cell, if available."
    end
  
    def display_input_warning
      puts "Sorry, that cell has already been selected."
    end
    
    def announce_winner(player)
      puts "Great game, #{player}. You beat your opponent."
      puts "Do you guys want a rematch? Press 'y' for yes or 'n' for no."
    end
  
    def announce_draw
      puts "It's a tie."
    end
end