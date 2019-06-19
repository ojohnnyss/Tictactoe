# Tictactoe
# Tic Tac Toe in Ruby

## Overview

Thia is a two-player CLI version of Tic Tac Toe by defining a set of methods
to encapsulate the game logic.

## Objectives

1.  Build the Tic Tac Toe application
2.  Write a method that is responsible for the game loop in Tic Tac Toe
3.  Code the main executable file that will run the game in the CLI

## The Final Product

When complete, the game will look something like this when played: https://www.youtube.com/embed/e4TMZ0f6qoI

#### `bin/tictactoe`

This is our main executable and will be how we run our game.

#### `lib/tic_tac_toe.rb`

All of our game methods will be coded here.

#### `spec`

There are three test files that should be completed in order.
`01_tic_tac_toe_spec.rb` sets tests for our helper methods. `02_play_spec.rb`
tests the main `#play` method. `03_cli_spec.rb` tests the CLI.

### Your Tic Tac Toe Game

There are infinite ways to build Tic Tac Toe. We, however, have been building up
to a very specific structure with the methods we've been building throughout
this course. We'll be using many of those methods here. These methods represent
the basic requirements and logic of the game.

Why build and utilize the helper methods we've been constructing?

Let's take a look at what it would require to print out a board three times,
without any helper methods:

```ruby
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
```

Now, let's take a look at the same task, encapsulated into a method that we can
simply call, or invoke, three times.

```ruby
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

display_board(board)
display_board(board)
display_board(board)
```

When our logic is well encapsulated by individual methods everything about our
code is easier. We can re-use the same logic again and again, painlessly.

You'll approach building Tic Tac Toe in this manner, first defining helper
methods according to the test requirements and then slowly putting them together
to define the complete play logic.

You'll then use this play method within a CLI and build a fully functioning 2
player Tic Tac Toe CLI in Ruby!

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

## Instructions

### Helper Methods

Open up `lib/tic_tac_toe.rb`. You'll be coding your helper methods here. Run the
tests for these methods by typing `rspec spec/01_tic_tac_toe_spec.rb` in the
terminal. Use the test output, along with the guidelines below, to build these
methods.

#### `WIN_COMBINATIONS`

Define a constant in `lib/tic_tac_toe.rb` `WIN_COMBINATIONS` and set it equal to
a nested array filled with the index values for the various win combinations in
tic tac toe.

```ruby
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5]  # Middle row
  # ETC, an array for each win combination
]
```

#### `#display_board`

Define a method that prints the current board representation based on the
`board` argument passed to the method.

An empty board would be:

```ruby
board = [" "," "," "," "," "," "," "," "," "]
display_board(board)
```

Outputting:

```
   |   |
-----------
   |   |
-----------
   |   |
```

A board with an "X" in the middle:

```ruby
board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
display_board(board)
```

Outputting:

```
   |   |
-----------
   | X |
-----------
   |   |
```

#### `#input_to_index`

Once the user inputs where they would like to go on the board, we then have to
convert this to the board index multiple times. Instead of doing that in a lot
of places, we can remove this repetitive code and put it in this helper method.
This method takes the user_input (which is a string), converts it to an Integer,
and subtracts 1. Remember that, from the player's point of view, the board
contains spaces 1-9. But, an array's indexes start their count at 0.

#### `#move`

Your `#move` method must take in three arguments: **1)** the board array,
**2)** the index in the board array that the player would like to fill out with
an "X" or and "O", and **3)** the player's character (either "X" or "O"). We
previously had you write this method with a default argument of "X" for the
third argument, but that is no longer needed.

#### `#position_taken?`

The `#position_taken?` method will be responsible for evaluating the position
selected by the user against the Tic Tac Toe board and checking to see whether
or not that index on the board array is occupied. If the user would like to fill
out position 1, our `#position_taken?` method will check to see if that board
index is vacant or if it contains an "X" or an "O". If the position is free, the
method should return `false` (i.e. "not taken"), otherwise it will return
`true`.

#### `#valid_move?`

Build a method `valid_move?` that accepts a board and an index to check and
returns `true` if the move is valid and `false` or `nil` if not. A valid move
means that the submitted position is:

1.  Present on the game board.
2.  Not already filled with a token.

#### `#turn`

Build a method `#turn` to encapsulate the logic of a single complete turn
composed of the following routine:

1.  Asking the user for their move by position 1-9.
2.  Receiving the user input.
3.  Convert user input to an index
4.  If the move is valid, make the move and display board.
5.  Otherwise (that is, if the move is invalid) ask for a new position until a
    valid move is received.

All these procedures will be wrapped into our `#turn` method. However, the
majority of the logic for these procedures will be defined and encapsulated in
individual methods which you've already built.

You can imagine the pseudocode for the `#turn` method:

```
ask for input
get input
convert input to index
if move is valid
  make the move for index and show board
else
  ask for input again until you get a valid move
end
```

#### `#turn_count`

This method takes in an argument of the board array and returns the number of
turns that have been played.

#### `#current_player`

The `#current_player` method should take in an argument of the game board and
use the `#turn_count` method to determine if it is `"X"`'s turn or `"O"`'s.

#### `#won?`

Your `#won?` method should accept a board as an argument and return **false** if
there is no win combination present in the board and return the winning
combination indexes as an array if there is a win. Use your `WIN_COMBINATIONS`
constant in this method.

#### `#full?`

The `#full?` method should accept a board and return true if every element in
the board contains either an "X" or an "O".

#### `#draw?`

Build a method `#draw?` that accepts a board and returns true if the board has
not been won and is full and false if the board is not won and the board is not
full, and false if the board is won.

#### `#over?`

Build a method `#over?` that accepts a board and returns true if the board has
been won, is a draw, or is full.

#### `#winner`

The `#winner` method should accept a board and return the token, "X" or "O" that
has won the game given a winning board.

### Putting it all together: the `#play` method

#### `#play`

The play method is the main method of the tic tac toe application and is
responsible for the game loop. A tic tac toe game must allow players to take
turns, checking if the game is over after every turn, and at the conclusion of
the game, whether because it was won or because it was a draw, reporting to the
user the outcome of the game. You can imagine the pseudocode:

```
until the game is over
  take turns
end

if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it has been a draw
end
```
