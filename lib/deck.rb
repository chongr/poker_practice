require_relative "card"
require_relative "hand"

class Deck


  def initialize(cards = nil)
    @deck = Deck.all_cards if cards == nil
    @deck = cards if cards
  end

  def self.all_cards

    initial_deck = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        initial_deck << Card.new(suit, value)
      end
    end

    initial_deck
  end

  def count
    @deck.count
  end

  def take(n)
    taken_cards = []
    n.times do |num|
      raise "not enough cards" if @deck.empty?
      taken_cards << @deck.shift
    end

    taken_cards
  end

  def return(cards)
    @deck.concat(cards)
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_hand
  end
end
