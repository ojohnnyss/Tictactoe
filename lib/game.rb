class Game 
   
  def initialize
    @pieces = [0, 0, 0,
               0, 0, 0,
               0, 0, 0]
    @players = []
    (1..2).each { |i| add_player(i) }
    @win = 0   
  end

  def add_piece(p)
    #@pieces[p.pos] = p
     return "X"
  end

  def add_player(player)
    if player == 1
      #iput_player
      @players[1] = Player.new($piece == "X" ? 1 : 2)
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
      pos = 1 #gets.chomp.to_i

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
    
    print_board(display_board)

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
