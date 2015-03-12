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

  def how_many_aces?
    ace_count = 0
    @cards_in_hand.each do |card|
      ace_count += 1 if card.card_type == "ace"
    end
    ace_count
  end

  def score
    score = 0
    @cards_in_hand.each do |card|
      score += card.value.to_i if card.card_type == "number"
      score += 10 if card.card_type == "face card"
      score += 11 if card.card_type == "ace"
    end

    if score > 21 && how_many_aces? > 0
      how_many_aces?.times do
        score -= 10
        break if score < 21
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
