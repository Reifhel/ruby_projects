# The core of game logic used in player and computer solver
module GameLogic
  COLORS = %w[purple green red blue white yellow].freeze

  def solved?(code, guess)
    code == guess
  end

  def compare(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone

    @exact_number = exact_matches(temp_code, temp_guess)
    @same_number = right_matches(temp_code, temp_guess)
    @total_number = exact_number + same_number
  end

  def exact_matches(code, guess)
    exact = 0
    code.each_with_index do |item, i|
      next unless guess[i] == item

      exact += 1
      code[i] = "*"
      guess[i] = "*"
    end
    exact
  end

  def right_matches(code, guess)
    right = 0
    guess.each_index do |i|
      next unless guess[i] != "*" && code.include?(guess[i])

      right += 1
      position = code.find_index(guess[i])
      code[position] = "?"
      guess[i] = "?"
    end
    right
  end
end
