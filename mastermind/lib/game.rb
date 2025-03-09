require_relative 'player_solver'
require_relative 'computer_solver'

# main class to start the game

class Game

  def play
    code_breaker.player_start
  end

  # Mode where the players solve the code
  def code_breaker
    breaker = PlayerSolver.new
  end

end