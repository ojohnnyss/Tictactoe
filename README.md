# Tic Tac Toe in Ruby

## Overview

Thia is a two-player CLI version of Tic Tac Toe by defining a set of methods
to encapsulate the game logic. This game is a result of accomplishing ruby course at learn.co

## Objectives

1.  Build the Tic Tac Toe application
2.  Write a method that is responsible for the game loop in Tic Tac Toe
3.  Code the main executable file that will run the game in the CLI

## The Final Product

When complete, the game will look something like this when played: https://www.youtube.com/embed/e4TMZ0f6qoI

#### `bin/tictactoe`, `bin/gameboard.rb`

This is our main executable and will be how we run our game.

#### `lib/player.rb`, `lib/gamepiece.rb` 

All of our game methods will be coded here.

### Tic Tac Toe Game

### Game Conventions

We'll be representing a Tic Tac Toe board using an array of `" "` strings. We'll
pass this board to every method as an argument so the helper methods can
interact with or introspect on the board.

We'll be getting user input via `gets` and a player will choose a position on
the board by entering 1-9. Our program will then fill out the appropriate
position on the board with the player's token. The term 'position' will refer to
the spot on the board as the player sees it (1-9).

We will keep track of which player's turn it is and how many turns have been
played. We will check to see, at every turn, if there is a winner. If there is a
winner, we'll congratulate them. If there is a tie, we will inform our players.

