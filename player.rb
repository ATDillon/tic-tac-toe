# Creates Player objects
class Player
  attr_reader :output, :player_name

  def initialize(player_name, output)
    @player_name = player_name
    @output = output
  end

  private

  def player_input
    gets.chomp.to_i
  end

  def one_coordinate
    begin
      coordinate = player_input
      raise unless coordinate >= 0 && coordinate < 3
    rescue RuntimeError
      puts 'Error, please put a number 0-2:'
      retry
    end
    coordinate
  end

  public

  def both_coordinates
    coordinates = []
    puts "#{player_name}, please enter X then Y coordinates (0-2):"
    puts 'X:'
    coordinates.push(one_coordinate)
    puts 'Y:'
    coordinates.push(one_coordinate)
  end
end
