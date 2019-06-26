require_relative 'ui.rb'
require_relative 'player.rb'
require_relative 'gamepiece.rb'
require_relative 'gameboard.rb'

include UI



game_board = GameBoard.new

result = game_board.game_loop
if result == 0
  puts "Current board:"
  game_board.render_board
  puts "Cat's game!"
else
  puts "Current board:"
  game_board.render_board
  if result == 1
  puts "#{$name1} wins!"
  else
  puts "#{$name2} wins!"
  end
  if result == 1 || result == 2
     puts "It was excited! Bye-bye."
  end
end
