module UI
puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
puts "X   WELCOME TO TIC TAC TOE!   X"
puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
                    [0,3,6], [1,4,7], [2,5,8], 
                    [0,4,8], [2,4,6]]          

def add_player(player)
  
    if player == 1
    puts "Please, enter first player name"
    $name1 = gets.chomp
    puts "Please, enter second player name"
    $name2 = gets.chomp
    puts "#{$name1}, which piece do you want? (X/O)" 

      piece_set = false
      while !piece_set
        piece = gets.chomp.upcase
        unless piece == "X" || piece == "O"
          puts "Please enter X or O!"
        else
          piece_set = true
        end
      end
      @players[1] = Player.new(piece == "X" ? 1 : 2)
    elsif player == 2
      @players[2] = Player.new(@players[1].type == 1 ? 2 : 1)
    end
  end

  def player_move(player)
    if player == 1
    puts "#{$name1}, select where to place your #{@players[player].type == 1 ? "X" : "O"} (1..9)"
    else
    puts "#{$name2}, select where to place your #{@players[player].type == 1 ? "X" : "O"} (1..9)"
    end
    render_board(false)

    pos_set = false
    while !pos_set
      pos = gets.chomp.to_i

      if !(1..9).include?(pos)
        puts "Please enter a number 1 through 9!"
      elsif @pieces[pos-1] != 0
        puts "There's already a piece there! Try another position."
      else
        pos -= 1 # go from human to array position
        pos_set = true
      end
    end
    
    add_piece(GamePiece.new(@players[player].type, pos))
  end

  def render_board(render_pieces = true)
    if render_pieces
      display_board = 
        @pieces.collect do |p|
          begin
            type = p.type
          rescue
            " "
          else
            case type
            when 1
              "X"
            when 2
              "O"
            end
          end
        end
    else
      display_board = [*(1..9)]
    end
    
    puts " #{display_board[0]} | #{display_board[1]} | #{display_board[2]} "
    puts "___________"
    puts
    puts " #{display_board[3]} | #{display_board[4]} | #{display_board[5]} "
    puts "___________"
    puts
    puts " #{display_board[6]} | #{display_board[7]} | #{display_board[8]} "
    puts

  end 

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
