# Creates Player objects
class Player
  def initialize(player_name)
    @player_name = player_name
  end

  def gets_square
    gets.chomp
  end
end
