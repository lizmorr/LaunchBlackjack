class Deck
  def initialize
    @deck = []
    SUITS.each do |suit|
      FACE_VALUE.each do |value|
        @deck << Card.new(value, suit)
      end
    end
    @deck.shuffle!
  end

  def draw!
    @deck.pop
  end
end
