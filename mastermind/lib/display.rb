# module for the text informations and output to the user
module Display
  def clue_colors(description)
    {
      "exact" => "\e[91m\u25CF\e[0m ",
      "same" => "\e[37m\u25CB\e[0m "
    }[description]
  end

  def show_clues(exact_n, same_n, guess)
    puts <<~HEREDOC
      With the guess #{guess} you got:
      #{exact_n} exact value
      #{same_n} same value

    HEREDOC
  end

  def error_message(message)
    {
      "len_error" => "Less than or greater than 4 values inputed",
      "value_not_found" => "Value not found in colors list",
      "invalid_game_mode" => "Mode invalid choose between 1 and 2"
    }[message]
  end

  def turn_message(message, turn)
    {
      "guess_prompt" => "Turn ##{turn}: Type 4 colours in (purple, green, red, blue, white, yellow) to guess the code",
      "computer" => "\n\nComputer Turn ##{turn}:"
    }[message]
  end

  def end_game_message(message)
    {
      "player_won" => "You solved the code! Congrats!",
      "player_lose" => "Game over bro! Next lucky on next try!",
      "computer_won" => "This was a easy one, try harder next!",
      "computer_lose" => "Wait, I was beaten by a human???? DO YOU CHEATED!"
    }[message]
  end
end
