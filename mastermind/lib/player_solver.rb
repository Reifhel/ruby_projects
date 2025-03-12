require_relative 'game_logic.rb'
require_relative 'display.rb'

# This class contains the logic by the human solving the code
class PlayerSolver
  
  include GameLogic
  include Display

  attr_reader :computer_code, :exact_number, :same_number
  attr_accessor :guess, :turn

  def initialize
    @computer_code = self.set_random_code
    @guess = nil
  end

  def player_start
    puts "The player now has to break the code!"
    self.turn_order
    self.player_end_game(@computer_code, @guess)
  end

  def turn_order
    turn = 1
    while turn <= 12
      turn_messages(turn)
      self.guess = player_input
      turn += 1

      break if solved?(self.computer_code, self.guess)

      turn_end
    end
  end

  def turn_messages(turn)
    puts turn_message('guess_prompt', turn)
    puts "LAST TURN!" if turn == 12
  end

  def turn_end
    compare(self.computer_code, self.guess)
    show_clues(exact_number, same_number, self.guess)
  end

  def player_end_game(code, guess)
    if solved?(code, guess)
      puts end_game_message('player_won')
    else
      puts end_game_message('player_lose')
      puts "The code was: (#{code.join(", ")})"
    end
  end

  private 

  def set_random_code
    code = []
    4.times { code.push(GameLogic::COLORS.sample) }
    code
  end

  def player_input
    input = gets.chomp.downcase.split(" ")

    if input.length == 4
      if input.all? {|value| GameLogic::COLORS.include?(value)}
        return input
      else
        puts message("value_not_found")
      end
    else
      puts message("len_error")
    end

    player_input
  end
end