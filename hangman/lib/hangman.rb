require_relative 'display.rb'

# Class for the game Hangman
class Hangman

  include Display

  attr_reader :dictionary
  attr_accessor :guessed_letters, :secret_word, :guess, :lifes

  def initialize
    @dictionary = self.load_dictionary
    @guessed_letters = Array.new()
    @lifes = 5
    @secret_word = nil
    @guess = nil
  end

  def load_dictionary
    word_dict = File.read('dictionary.txt').split("\n")
    # Getting olny words between 5 and 12 letters
    word_dict.select{ |word| word.length.between?(5,12)}
  end

  def game_start
    puts intructions
    setup_game
    until self.secret_word == self.guess.join or self.lifes <= 0
      p self.secret_word
      puts show_game_info(self.lifes, self.guess, self.guessed_letters)

      game_turn

    end
    game_end
  end

  def game_end
    if self.secret_word == self.guess.join
      puts end_game_message("win", self.secret_word)
    else
      puts end_game_message("lose", self.secret_word)
    end
  end

  def game_turn
    puts "Choose a letter"
    input = player_input
    if self.secret_word.include?(input)
      check_guess(input)
    else
      self.lifes -= 1
    end
    self.guessed_letters << input
  end

  def check_guess(input)
    secret_word_split = self.secret_word.split("")
    secret_word_split.each_with_index do |letter, i|
      if letter == input
        self.guess[i] = input
      end
    end
  end

  def setup_game
    self.guessed_letters = Array.new
    self.secret_word = self.dictionary.sample
    self.guess = Array.new(self.secret_word.length, "_")
    self.lifes = 5
  end

  def player_input
    input = gets.chomp.downcase
    unless self.guessed_letters.include?(input)
      if input.length == 1
        return input if input.match?(/[a-z]/) # Verifica se é uma letra de 'a' a 'z'
        
        puts error_game_message("invalid_input")
      else
        puts error_game_message("len_error")
      end
    else
      puts error_game_message("already_choosed")
    end
  
    player_input
  end
  

end
