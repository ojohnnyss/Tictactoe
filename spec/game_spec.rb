require '../lib/game'
require '../bin/ui'
require '../lib/player'
require '../lib/gamepiece'

# Game
RSpec.describe Game do
  before do
    @type = GamePiece.new(1, 4)
    @gamer = Game.new
    @type1 = Player.new(1)
  end

  context '#add_piece' do
    it "should return 'X' or 'O'" do
      expect(@gamer.add_piece('X')).to eql('X')
    end
  end

  context '#add_player' do
    it 'should add a player' do
      expect(@gamer.add_player(1)).to eql(1)
    end
  end

  context '#player_move' do
    it 'should put position of player on board' do
      expect(@gamer.player_move(1)).to eql('X' || 'O')
    end
  end

  context '#render_board' do
    it 'should show current board' do
      expect(@gamer.render_board(true)).to eql(nil)
    end
  end

  context '#game_won?' do
    it 'should return 0' do
      expect(@gamer.game_won?).to eql(0)
    end
  end

  context '#game_loop' do
    it 'should return 0' do
      expect(@gamer.game_loop).to eql(0)
    end
  end
  
end

