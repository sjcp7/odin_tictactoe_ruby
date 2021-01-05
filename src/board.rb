class Board

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  attr_reader :gameboard

  def initialize
    @gameboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def play(cell, piece)
    @gameboard[cell - 1] = piece
  end
  
  def to_s
    %{
      #{@gameboard[0]} | #{@gameboard[1]} | #{@gameboard[2]}
      #{@gameboard[3]} | #{@gameboard[4]} | #{@gameboard[5]}
      #{@gameboard[6]} | #{@gameboard[7]} | #{@gameboard[8]}
    }
  end

  def complete?
    @gameboard.any?(Integer) ? false : true
  end

  def cell_checked?(cell)
    @gameboard.any?(cell) ? false : true
  end

  def game_over?(piece)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |pos| @gameboard[pos] == piece }
    end
  end

  def clear
    @gameboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
