require_relative "./bin/ui.rb"
require_relative "player.rb"
require_relative "gamepiece.rb"

class GameBoard 
 include UI 
 
  def initialize
    @pieces = [0, 0, 0,
               0, 0, 0,
               0, 0, 0]
    @players = []

    (1..2).each { |i| add_player(i) }

    @win = 0
    
  end

  def add_piece(p)
    @pieces[p.pos] = p
  end


  def game_won?
    WIN_COMBINATIONS.each do |situation|
      result = 
        situation.collect do |pos|
          begin
            @pieces[pos].type
          rescue
            @pieces[pos]
          end
        end

      first_pos = result[0]
      won = result.all? {|pos| pos != 0 && pos == first_pos}
      if won 
        @win = first_pos == @players[1].type ? 1 : 2
        break
      end
    end
    return @win
  end

  
end

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
     puts "Bye-bye"
  end
 
end
