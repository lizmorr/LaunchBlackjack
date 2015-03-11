class Hand
  def initialize(cards_in_hand)
    @cards_in_hand = cards_in_hand
  end

  def cards_in_hand
    @cards_in_hand
  end

  def add(card)
    @cards_in_hand << card
  end

  def score
    score = 0
    @cards_in_hand.each do |card|
      score += card.value.to_i if card.card_type == "number"
      score += 10 if card.card_type == "face card"
      if card.card_type == "ace"
        if score <= 10
          score += 11
        else
          score += 1
        end
      end
    end
    score
  end

  def self.deal(deck)
    cards = []
    2.times do
      cards << deck.draw!
    end
    Hand.new(cards)
  end
end
