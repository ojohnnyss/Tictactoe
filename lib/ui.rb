module UI

puts "".center(40, "X")
puts "   WELCOME TO TIC TAC TOE!   ".center(40, "X")
puts "".center(40, "X")


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
                    [0,3,6], [1,4,7], [2,5,8], 
                    [0,4,8], [2,4,6]]          


def iput_player
  puts "Please, enter first player name"
    $name1 = gets.chomp
  puts "Please, enter second player name"
    $name2 = gets.chomp
  puts "#{$name1}, which piece do you want? (X/O)" 

  piece_set = false
  while !piece_set
    $piece = gets.chomp.upcase
    unless $piece == "X" || $piece == "O"
      puts "Please enter X or O!"
    else
      piece_set = true
   end
  end
end  
  
end
