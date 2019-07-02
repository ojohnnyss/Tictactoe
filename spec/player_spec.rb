require '../lib/player'

#Player
RSpec.describe Player do
  before do
    @type = Player.new(1)
    @type = Player.new(2)
  end

  context '# a new player with his number' do
    it 'creates a new player and assign number to him' do
      expect(@type.type).to eql(1 || 2)
    end
  end

end
