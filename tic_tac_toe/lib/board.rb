# Object for the methods on the board for tic_tac_toe game
class Board
  WIN_CONDITION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def mark_value(marker, position)
    board[position] = marker
  end

  def show_board
    print("\n")
    p "#{board[0]} | #{board[1]} | #{board[2]}"
    p "#{board[3]} | #{board[4]} | #{board[5]}"
    p "#{board[6]} | #{board[7]} | #{board[8]}"
    print("\n")
  end

  def full_board?
    board.all? { |cell| cell.to_s =~ (/[^0-9]/) }
  end

  def check_win?
    WIN_CONDITION.any? do |comb|
      # Verify if the combination array has a unique symbol
      [board[comb[0]], board[comb[1]], board[comb[2]]].uniq.length == 1
    end
  end

  attr_reader :board
end
