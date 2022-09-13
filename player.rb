# Create two players
class Player
    attr_reader :name, :character
    def initialize(name, character)
      @name = name.captialize
      @character = character
    end 
end