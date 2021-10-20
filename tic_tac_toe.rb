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
    @spaces = [[' ', ' ', ' '], [' ', 'x', ' '], [' ', ' ', ' ']]
  end

  def round; end

  public

  def test
    board.inputs=(spaces.flatten)
    board.print_board
  end
end

game = TicTacToe.new("abby", "jane", TicTacBoard.new)
game.test
