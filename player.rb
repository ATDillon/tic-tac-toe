# Creates Player objects
class Player
  attr_reader :output, :player_name

  def initialize(player_name:, output:)
    @player_name = player_name
    @output = output
  end

  private

  def player_input
    gets.chomp.to_i
  end

  def selection_check
    begin
      selection = player_input
      raise unless selection >= 1 && selection <= 9
    rescue RuntimeError
      puts 'Error, please enter a number 1-9:'
      retry
    end
    selection
  end

  public

  def coordinates
    coordinates = { 1 => [0, 0], 2 => [0, 1], 3 => [0, 2],
                    4 => [1, 0], 5 => [1, 1], 6 => [1, 2],
                    7 => [2, 0], 8 => [2, 1], 9 => [2, 2] }
    puts "#{player_name}, enter a number 1-9:"
    coordinates[selection_check]
  end
end
