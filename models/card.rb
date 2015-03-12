class Card
  def initialize(value,suit)
    @value = value
    @suit = suit
  end

  def value
    @value
  end

  def card_type
    if @value == "A"
      "ace"
    elsif ["J","Q","K"].include?(@value)
      "face card"
    else
      "number"
    end
  end

  def display
    "#{@value}#{@suit}"
  end
end
