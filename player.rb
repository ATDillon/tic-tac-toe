# Creates Player objects
class Player
  attr_reader :output

  def initialize(player_name, output)
    @player_name = player_name
    @output = output
  end

  def gets_square
    gets.chomp
  end
end
