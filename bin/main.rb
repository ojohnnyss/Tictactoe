require_relative './ui.rb'
require_relative '../lib/player.rb'
require_relative '../lib/gamepiece.rb'
require_relative '../lib/game.rb'

include UI

def start
  game = Game.new
  result = game.game_loop
  if result.zero?
    puts "Current board:"
    game.render_board
    puts "Cat's game!"
  else
    puts "Current board:"
    game.render_board
    puts result == 1 ? "#{$name1} wins!" : "#{$name2} wins!"
    if result == (1 || 2)
      puts "It was exciting! Bye-bye."
    end
  end
end

start
