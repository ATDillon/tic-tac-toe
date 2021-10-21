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
    @spaces = [[' ', ' ', ' '], [' ', ' ', ' '], ['x', ' ', 'x']]
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

  def round; end

  public

  def test
    board.inputs=(spaces.flatten)
    board.print_board
  end
end
