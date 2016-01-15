require_relative 'card'

class Hand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
    raise "must have five cards" if cards.length < 5
  end

  def trade_cards(take_cards, new_cards)
    take_cards.each do |card|
      deleted = cards.delete(card)
      raise "cannot discard unowned card" unless deleted
    end

    cards.concat(new_cards)
    raise "must have five cards" if cards.length != 5
  end

  

end
