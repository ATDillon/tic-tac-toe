# Tracks state of tictactoe board
class TicTacBoard
  attr_accessor :inputs

  def initialize(inputs = Array.new(9) { ' ' })
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

  public

  def print_board
    puts board(inputs)
  end
end
