require_relative 'tic_tac_board'
require_relative 'player'

# Tracks state of the tic tac toe game
class TicTacToe
  private

  attr_reader :player_one, :player_two, :board
  attr_accessor :spaces

  def initialize(player_one, player_two, board)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @spaces = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def row_filled?(output)
    spaces.any? { |array| array.all?(output) }
  end

  def column_filled?(output)
    if spaces.all? { |array| array[0] == output } || spaces.all? { |array| array[1] == output} ||
       spaces.all? { |array| array[2] == output }
      true
    end
  end

  def diagonal_filled?(output)
    if (spaces[0][0] == output && spaces[1][1] == output && spaces[2][2] == output) ||
       (spaces[0][2] == output && spaces[1][1] == output && spaces[2][0] == output)
      true
    end
  end

  def player_win?(output)
    if row_filled?(output) || column_filled?(output) || diagonal_filled?(output)
      true
    end
  end

  def player_coordinates(player)
    coordinates_check(player.coordinates, player)
  end

  def coordinates_check(coordinates, player)
    begin
      raise unless spaces[coordinates[1]][coordinates[0]] == ' '
    rescue RuntimeError
      puts 'Space already taken, please try again'
      coordinates = player_coordinates(player)
      retry
    end
    coordinates
  end

  def mark_board(player)
    coordinates = player_coordinates(player)
    spaces[coordinates[1]][coordinates[0]] = player.output
    board.inputs=(spaces.flatten)
  end

  def victory?(player)
    if player_win?(player.output) == true
      puts "Congrats #{player.player_name}! You win!"
      true
    end
  end

  def draw?
    unless spaces.flatten.include?(' ')
      puts 'Cats game!'
      true
    end
  end

  def instructions
    puts "It's time for Tic Tac Toe! Coordinates 0, 0 refer to the top left corner and 2, 2 are bottom right!"
    puts ' '
  end

  def round(player)
    mark_board(player)
    board.print_board
  end

  public

  def game
    instructions
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

  def test
    board.inputs=(spaces.flatten)
    board.print_board
  end
end

TicTacToe.new(Player.new("Player One", "x"), Player.new("Player Two", "o"), TicTacBoard.new).game