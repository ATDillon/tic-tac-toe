# Tracks state of tictactoe board
class TicTacBoard
  attr_accessor :inputs

  def initialize(inputs: Array.new(3) { Array.new(3) { ' ' } })
    @inputs = inputs
  end

  private

  def board(spaces)
    <<-BOARD
     #{spaces[0]} | #{spaces[1]} | #{spaces[2]}
    ---|---|---
     #{spaces[3]} | #{spaces[4]} | #{spaces[5]}
    ---|---|---
     #{spaces[6]} | #{spaces[7]} | #{spaces[8]}
    BOARD
  end

  def row_filled?(mark)
    inputs.any? { |array| array.all?(mark) }
  end

  def column_filled?(mark)
    if inputs.all? { |array| array[0] == mark } || inputs.all? { |array| array[1] == mark} ||
       inputs.all? { |array| array[2] == mark }
      true
    end
  end

  def opposite_corners?(mark)
    true if (inputs[0][0] == mark && inputs[2][2] == mark) || (inputs[0][2] == mark && inputs[2][0] == mark)
  end

  def diagonal_filled?(mark)
    true if opposite_corners?(mark) && inputs[1][1] == mark
  end

  public

  def mark_board(mark, coordinates)
    inputs[coordinates[0]][coordinates[1]] = mark
  end

  def three_in_row?(mark)
    true if diagonal_filled?(mark) || column_filled?(mark) || diagonal_filled?(mark)
  end

  def print_board
    puts board(inputs.flatten)
    puts ' '
  end
end
