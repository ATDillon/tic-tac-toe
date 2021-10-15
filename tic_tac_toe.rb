require_relative 'tic_tac_board'
require_relative 'player'

# Tracks state of the tic tac toe game
class TicTacToe
  def initialize
    @board = TicTacBoard.new(['x', 'x', 'o', 'x', 'o', 'o', 'o', 'o', 'o'])
    @board.print_board
  end
end

new_game = TicTacToe.new
