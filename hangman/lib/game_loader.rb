require_relative "display"
require "fileutils"

# Contains methods to save or load a game
module GameLoader
  include Display

  def save_game
    FileUtils.mkdir_p "saves"
    @filename = "#{random_name}_game.yaml"
    File.write("saves/#{@filename}", save_to_yaml)
    puts loader_message("save", filename)
  end

  def save_to_yaml
    YAML.dump(
      "secret_word" => @secret_word,
      "guess" => @guess.join,
      "guessed_letters" => @guessed_letters,
      "lifes" => @lifes
    )
  end

  def random_name
    adjective = %w[red best dark fun blue cold last tiny new pink]
    nouns = %w[car hat star dog tree foot cake moon key rock]
    "#{adjective[rand(0 - 9)]}_#{nouns[rand(0 - 9)]}_#{rand(11..99)}"
  end

  def list_all_saves
    all_saves = Dir["saves/*"].select { |f| File.file? f }.map { |f| File.basename f }

    if all_saves.length <= 0
      p error_game_message("no_saved_games")
      return reset_game
    end

    all_saves.each_with_index do |name, index|
      puts "##{index + 1}-> #{name}"
    end
  end

  def load_game
    list_all_saves
    print "Insert the name of the save: "
    save_name = gets.chomp
    load_saved_data(save_name)
    puts loader_message("load", save_name)
  rescue Psych::SyntaxError => e
    puts "YAML syntax error: #{e.message}"
  rescue Errno::ENOENT
    puts "File not found: #{save_name}"
    retry
  end

  def load_saved_data(save_name)
    data = YAML.load_file("saves/#{save_name}")
    self.secret_word = data["secret_word"]
    self.lifes = data["lifes"]
    self.guessed_letters = data["guessed_letters"]
    self.guess = data["guess"].chars
  end
end
