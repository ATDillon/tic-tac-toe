require_relative 'tic_tac_board'
require_relative 'player'

# Tracks state of the tic tac toe game
class TicTacToe
  private

  attr_reader :player_one, :player_two, :board
  attr_accessor :spaces

  def initialize(player_one:, player_two:, board:)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def player_coordinates(player)
    coordinates_check(player.coordinates, player)
  end

  def coordinates_check(coordinates, player)
    begin
      raise unless board.inputs[coordinates[0]][coordinates[1]] == ' '
    rescue RuntimeError
      puts 'Space already taken, please try again'
      coordinates = player_coordinates(player)
      retry
    end
    coordinates
  end

  def mark_board(player)
    board.mark_board(player.output, player_coordinates(player))
  end

  def player_win?(mark)
    true if board.three_in_row?(mark)
  end

  def victory?(player)
    if player_win?(player.output) == true
      puts "Congrats #{player.player_name}! You win!"
      true
    end
  end

  def draw?
    unless board.inputs.flatten.include?(' ')
      puts 'Cats game!'
      true
    end
  end

  def round(player)
    mark_board(player)
    board.print_board
  end

  public

  def game
    board.print_board
    loop do
      round(player_one)
      break if victory?(player_one)

      break if draw?

      round(player_two)
      break if victory?(player_two)

      break if draw?
    end
  end
end

TicTacToe.new(player_one: Player.new(player_name: 'Player One', output: 'x'),
              player_two: Player.new(player_name: 'Player Two', output: 'o'),
              board: TicTacBoard.new).game
