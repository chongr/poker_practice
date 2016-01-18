class Card

  SUIT_STRINGS = {
  :clubs    => "♣",
  :diamonds => "♦",
  :hearts   => "♥",
  :spades   => "♠"
}

VALUE_STRINGS = {
  :two   => "2",
  :three => "3",
  :four  => "4",
  :five  => "5",
  :six   => "6",
  :seven => "7",
  :eight => "8",
  :nine  => "9",
  :ten   => "10",
  :jack  => "J",
  :queen => "Q",
  :king  => "K",
  :ace   => "A"
}

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.royal_values
    VALUE_STRINGS.keys[-5..-1]
  end

  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    raise "invalid suit" unless SUIT_STRINGS[suit]
    raise "invalid value" unless VALUE_STRINGS[value]
    @suit = suit
    @value = value
  end

  def <=>(other_card)
    if value == other_card.value && suit == other_card.suit
      return 0
    elsif value != other_card.value
      Card.values.index(value) <=> Card.values.index(other_card.value)
    elsif suit != other_card.suit
      Card.suits.index(suit) <=> Card.suits.index(other_card.suit)
    end


  end



end
