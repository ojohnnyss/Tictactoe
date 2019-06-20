class GamePiece
  attr_reader :pos, :type

  def initialize(type, pos)
    @type = type
    @pos = pos
  end
end
