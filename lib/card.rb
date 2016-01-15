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

  def <=>(second)
    first_suit = self.suit
    second_suit = second.suit
    first_value = self.value
    second_value = second.value

    if first_suit == second_suit && second_value == first_value
      return 0
    elsif first_value < second_value
      return 1
    elsif SUIT_STRINGS[first_suit] < SUIT_STRINGS[second_suit] && first_value == second_value
      return 1
    else
      return -1
    end

  end



end
