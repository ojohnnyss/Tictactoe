class Play
  def play
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "X   WELCOME TO TIC TAC TOE!   X"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    ob = TicTacToe.new
    
    until ob.over? == true
      ob.turn
    end

    if ob.won?
      puts "Congratulations #{ob.winner}!"
    elsif ob.draw?
      puts "Cat's Game!"
    end
  end
end
