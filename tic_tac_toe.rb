require_relative 'tic_tac_board'
require_relative 'player'

# Tracks state of the tic tac toe game
class TicTacToe
  attr_reader :player_one, :player_two, :board

  def initialize(player_one, player_two, board)
    @board = board
    @player_one = player_one
    @player_two = player_two
  end

  def round; end

  def test
    board.print_board
  end
end

game = TicTacToe.new("abby", "jane", TicTacBoard.new(['x', 'x', 'o', 'x', 'o', 'o', 'o', 'o', 'o']))
game.test
