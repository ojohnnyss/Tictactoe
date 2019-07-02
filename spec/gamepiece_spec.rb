require '../lib/gamepiece'

#GamePiece
RSpec.describe GamePiece do
  before do
    @type = GamePiece.new(1, 4)
    @type1 = GamePiece.new(2, 9)
    @type2 = GamePiece.new(3,12)
  end

  context '# a player gets a position' do
    it 'a player gets new position on board' do
      expect(@type.type).to eql(1)
      expect(@type1.type).to eql(2)
      expect(@type.pos).to eql(4)
      expect(@type1.pos).to eql(9)
    end
  end

  context '# behavior of players' do
    it 'should play if the game passes type or pos' do
        expect(@type2.type).not_to be_nil
        expect(@type2.pos).not_to be_nil
    end
  end
end
