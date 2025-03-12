require_relative "player_solver"
require_relative "computer_solver"
require_relative "display"

# main class to start the game
class Game
  include Display

  def play
    puts "Choose the game mode,( 1 ) to break the code or ( 2 ) to the computer break the code"
    game_input = gets.chomp
    if game_input == "1"
      code_breaker.player_start
    elsif game_input == "2"
      code_maker.computer_start
    else
      puts error_message("game_mode_invalid")
      play
    end
  end

  # Mode where the players solve the code
  def code_breaker
    PlayerSolver.new
  end

  def code_maker
    ComputerSolver.new
  end
end
