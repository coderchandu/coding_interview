class Suit
  CLUBS = 1
  SPADE = 2
  DICE = 3
  HEART = 4
end

class Card
  attr_accessor :suit, :card_value

  def initialize(suit, value)
    @suite = suit
    @card_value = value
  end

  def card_value
    @card_value
  end
end

class BlackJack < Card
  def card_value
    if (@card_value == 1)
      return 11 #Ace is 11
    end
    return @card_value if (@card_value < 10)
    return 10 
  end

  def is_ace
    value == 11
  end
end
