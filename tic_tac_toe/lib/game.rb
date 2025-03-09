require_relative "board"
require_relative "player"
# The object dedicated to set the methods for the game
class Game
  def initialize
    @board = Board.new

    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  def setup_game
    puts "Welcome to the TIC TAC TOE ruby's game \n\n"

    self.first_player = setup_player
    self.second_player = setup_player

    # Randomize the initial players
    self.current_player = [@first_player, @second_player].sample
    puts "The initial player is #{current_player.name}"
  end

  def setup_player
    puts "Insert user name:"
    name = gets.chomp
    puts "Insert your symbol:"
    symbol = gets.chomp

    puts "Welcome #{name}, you choose the symbol #{symbol}!!\n\n"
    Player.new(name, symbol)
  end

  def switch_player
    self.current_player = if current_player == first_player
                            second_player
                          else
                            first_player
                          end
  end

  def play
    setup_game
    finished_game = board.check_win?
    board.show_board

    until finished_game
      puts "#{current_player.name}'s Turn - Choose the position:"
      choosed_position = gets.chomp.to_i - 1

      board.mark_value(current_player.symbol, choosed_position)
      board.show_board

      # check if win
      finished_game = board.check_win?
      if finished_game
        puts "The winner is #{current_player.name}!!"
      elsif board.full_board?
        puts "The result is Draw!!"
        finished_game = true
      else
        switch_player
      end
    end
  end

  attr_accessor :board, :first_player, :second_player, :current_player
end
