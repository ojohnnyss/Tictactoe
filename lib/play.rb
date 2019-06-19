class Play
  def play
    puts "XXXXXXXXXXXXXXXXXXX"
    puts "X   TIC TAC TOE   X"
    puts "XXXXXXXXXXXXXXXXXXX"
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
