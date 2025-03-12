require_relative 'game_logic.rb'
require_relative 'display.rb'

# This is the logic behind the computer solver
class ComputerSolver

  include GameLogic
  include Display

  attr_reader :master_code, :exact_number, :same_number
  attr_accessor :guess, :turn

  def initialize
    @all_possibilities = GameLogic::COLORS.repeated_permutation(4).to_a
    @find_code_guesses = all_possibilities.clone
    @turn = 1
    @master_code = nil
    @guess = nil
  end

  def computer_start
    puts "The computer now has to break the code!"
    self.master_code = self.set_code
    puts "The master code is #{self.master_code}"
    self.turn_order
    self.computer_end_game(self.master_code, self.guess)
  end

  def turn_order
    until self.turn > 12
    end
  end

  def computer_turn(master, guess)
  end

  def computer_end_game(code, guess) 
    if solved?(code, guess)
      puts end_game_message('computer_won')
    else
      puts end_game_message('computer_lose')
      puts "The code was: (#{code.join(", ")})"
    end
  end

  private

  def set_code
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

    set_code
  end
end
