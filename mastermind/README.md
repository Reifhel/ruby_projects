# Mastermind Game

This project is created for a Mastermind game from the command line where you have 12 turns to guess the secret code which is 4 colors select from the following group (purple, green, red, blue, white, yellow)

There is 2 modes:

* `player_solver` -> in this game mode the computer creates the code, and the player has to guess it, each turn the player receive a feedback about the guess.
* `computer_solver` -> In this mode the player who creates the code and the computer try to solve it.

## Project Structure

`main.rb` -> Principal file to execution of the project

`lib` -> directory with all the classes files

* `player_solver.rb` -> This class contains the logic behind the player_solver mode
* `computer_solver.rb` -> This class contains the logic behind the computer_solver mode
* `game_logic.rb` -> This is a module who contains the core of the game which is used in both solvers mode
* `display.rb` -> A utility module that includes all methods that display information to the user
* `game.rb` -> A simple class where is the start of the game

## What is used

For this is project i used Ruby, OOP, arrays and rubocop to check the code

## Knowledge acquired

* Project Management
* OOP
* Code quality with rubocop
