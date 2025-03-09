require_relative 'game_logic.rb'
require_relative 'display.rb'

# This class contains the logic by the human solving the code
class PlayerSolver
  
  include GameLogic
  include Display

  attr_reader :computer_code, :exact_number, :same_number
  attr_accessor :guess

  def initialize
    @computer_code = self.set_code
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
      turn_message(turn)
      @guess = player_input
      turn += 1

      break if solved?(self.computer_code, self.guess)

      turn_end
    end
  end

  def turn_message(turn)
    puts "Turn ##{turn} - Type 4 colours in #{GameLogic::COLORS} to guess the code:"
    puts "LAST TURN!" if turn == 12
  end

  def turn_end
    compare(self.computer_code, self.guess)
    show_clues(exact_number, same_number, self.guess)
  end

  def player_end_game(code, guess)
    if solved?(code, guess)
      puts("You solved the code! Congrats!")
    else
      puts "game over!, the code was #{code}"
    end
  end

  private 

  def set_code
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
        puts "Entrada invalida: um dos valores não bate com as cores"
      end
    else
      puts "Entrada invalida: menos de 4 valores"
    end

    player_input
  end
end