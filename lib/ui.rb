module UI

puts "".center(40, "X")
puts "   WELCOME TO TIC TAC TOE!   ".center(40, "X")
puts "".center(40, "X")


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
                    [0,3,6], [1,4,7], [2,5,8], 
                    [0,4,8], [2,4,6]]          



  

  def game_loop
    (1..9).each do |i|
      puts "Current board:"
      render_board

      player_move(i.odd? ? 1 : 2)
      
      won = game_won?
      return won unless won == 0
    end
    return 0
  end
end
