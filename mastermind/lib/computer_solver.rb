require_relative "game_logic"
require_relative "display"

# This is the logic behind the computer solver
class ComputerSolver
  include GameLogic
  include Display

  attr_reader :exact_number, :same_number
  attr_accessor :guess, :turn, :master_code, :find_code_guesses

  def initialize
    @all_possibilities = GameLogic::COLORS.repeated_permutation(4).to_a
    @find_code_guesses = @all_possibilities.clone
    @turn = 1
    @master_code = nil
    @guess = nil
  end

  def computer_start
    puts "The computer now has to break the code!"
    self.master_code = set_code
    puts "The master code is #{master_code}"
    turn_order
    computer_end_game(master_code, guess)
  end

  def turn_order
    while turn <= 12
      puts turn_message("computer", turn)
      self.guess = find_code_guesses.sample

      computer_turn(master_code, guess)
      break if solved?(master_code, guess)

      eliminate_code(guess, exact_number, same_number)

      self.turn += 1
      sleep(1)
    end
  end

  def computer_turn(_master, guess)
    compare(master_code, guess)
    show_clues(exact_number, same_number, self.guess)
  end

  def computer_end_game(code, guess)
    if solved?(code, guess)
      puts end_game_message("computer_won")
    else
      puts end_game_message("computer_lose")
      puts "The code was: (#{code.join(', ')})"
    end
  end

  def eliminate_code(guess, exact, same)
    find_code_guesses.select! do |e|
      compare(e, guess)
      exact == exact_number && same == same_number
    end
  end

  private

  def set_code
    input = gets.chomp.downcase.split

    if input.length == 4
      return input if input.all? { |value| GameLogic::COLORS.include?(value) }

      puts message("value_not_found")

    else
      puts message("len_error")
    end

    set_code
  end
end
