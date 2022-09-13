# Create two players
class Player
    attr_reader :name, :character
    def initialize(name, character)
      @name = name.capitalize
      @character = character
    end 
end

# p player_1 = Player.new('brendan', 'X')