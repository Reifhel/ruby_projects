# Module for output user informations
module Display
  def intructions
    <<~HEREDOC
      Welcome to the Hangman's Game
      Rules:
      1. You have to guess the secret word letter by letter
      2. You have 5 lifes, losing one when miss the a letter
      3. You can save the game at any point

      Type (1) for start a new game or (2) for load a game
    HEREDOC
  end

  def end_game_message(message, secret_word)
    {
      "win" => "Congrats you guessed the word -> #{secret_word}",
      "lose" => "Close one! The word was #{secret_word}"
    }[message]
  end

  def input_message
    "Choose a letter or play 'save' with you wanna save your game"
  end

  def loader_message(message, filename)
    {
      "save" => "The game was saved with the name -> #{filename}",
      "load" => "Game '#{filename}' loaded..."
    }[message]
  end

  def error_game_message(message)
    {
      "len_error" => "Choose only 1 letter please",
      "invalid_input" => "The value choosed was not a letter",
      "already_choosed" => "This value already was tried, please choose another",
      "no_saved_games" => "No saved games was found! Starting a new one"
    }[message]
  end

  def show_game_info(lifes, guess, guessed_letters)
    <<~HEREDOC

      You have #{lifes} lifes left
      Already tried letters -> #{guessed_letters}
      #{guess.join(' ')}

    HEREDOC
  end
end
