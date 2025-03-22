require_relative "display"
require_relative "game_loader"
require "yaml"

# Class for the game Hangman
class Hangman
  include Display
  include GameLoader

  attr_reader :dictionary
  attr_accessor :guessed_letters, :secret_word, :guess, :lifes

  def initialize
    @dictionary = load_dictionary
    @guessed_letters = []
    @lifes = 5
    @secret_word = nil
    @guess = nil
  end

  def setup_game
    puts intructions
    begin
      game_mode = gets.chomp
      return reset_game if game_mode == "1" # Create a new game
      return load_game if game_mode == "2" # load a saved game

      raise "Invalid input: #{guess}"
    rescue StandardError => e
      puts e
      retry
    end
  end

  def game_start # rubocop:disable Metrics/MethodLength
    setup_game

    until over?
      puts show_game_info(lifes, guess, guessed_letters)
      puts input_message
      input = player_input
      if input == "save"
        save_game
        break
      end

      game_turn(input)

    end
    game_end if over?
  end

  def over?
    (secret_word == guess.join) || (lifes <= 0)
  end

  def game_end
    if secret_word == guess.join
      puts end_game_message("win", secret_word)
    else
      puts end_game_message("lose", secret_word)
    end
  end

  def game_turn(input)
    if secret_word.include?(input)
      check_guess(input)
    else
      self.lifes -= 1
    end
    guessed_letters << input
  end

  def check_guess(input)
    secret_word_split = secret_word.chars
    secret_word_split.each_with_index do |letter, i|
      guess[i] = input if letter == input
    end
  end

  def reset_game
    self.guessed_letters = []
    self.secret_word = dictionary.sample
    self.guess = Array.new(secret_word.length, "_")
    self.lifes = 5
  end

  def player_input # rubocop:disable Metrics/MethodLength
    input = gets.chomp.downcase
    return "save" if input == "save"

    if guessed_letters.include?(input)
      puts error_game_message("already_choosed")
    elsif input.length == 1
      return input if input.match?(/[a-z]/) # Verifica se é uma letra de 'a' a 'z'

      puts error_game_message("invalid_input")
    else
      puts error_game_message("len_error")
    end

    player_input
  end

  def load_dictionary
    word_dict = File.read("dictionary.txt").split("\n")
    # Getting olny words between 5 and 12 letters
    word_dict.select { |word| word.length.between?(5, 12) }
  end
end
