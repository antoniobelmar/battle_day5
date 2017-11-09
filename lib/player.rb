class Player
  attr_reader :name
  attr_accessor :hp

 def initialize(name)
   @name = name
   @hp = 60
 end

 def attack(player)
   player.hp -= 10
 end

end
