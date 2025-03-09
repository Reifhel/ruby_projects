# module for the text informations and output to the user
module Display

  def clue_colors(description)
    {
      'exact' => "\e[91m\u25CF\e[0m ",
      'same' => "\e[37m\u25CB\e[0m "
    }[description]
  end

  def show_clues(exact_n, same_n, guess)
    puts <<~HEREDOC
      With the guess #{guess} you got:
      #{exact_n} exact value
      #{same_n} same value

    HEREDOC
  end
end