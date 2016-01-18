require_relative 'card'
require 'byebug'
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

  HAND_RANKS = {
        royal_flush: 10,
        straight_flush: 9,
        four_of_a_kind: 8,
        full_house: 7,
        flush: 6,
        straight: 5,
        three_of_a_kind: 4,
        two_pair: 3,
        one_pair: 2,
        high_card: 1
  }
  def rank
    return  :royal_flush if is_royal_flush?
    return  :straight_flush if is_straight_flush?
    return  :four_of_a_kind if is_four_of_a_kind?
    return  :full_house if is_full_house?
    return  :flush if is_flush?
    return  :straight if is_straight?
    return  :three_of_a_kind if is_three_of_a_kind?
    return  :two_pair if is_two_pair?
    return  :one_pair if is_pair?
    
    :high_card
  end
  
  def is_royal_flush?
    return false unless is_flush?
    
    all_royals = Card.royal_values.all? do |royal_value|
      @cards.map {|card| card.value}.include?(royal_value)
    end
    
    return true if all_royals
    
    false
  end
  
  def is_flush?
    hand_suit = @cards.first.suit
    @cards.each do |card|
      return false if card.suit != hand_suit
    end
    
    true
      
  end
  
  def is_straight?
    sorted_cards = @cards.sort 
    all_card_values = sorted_cards.map(&:value)
    
    if all_card_values.include?(:ace) && all_card_values.include?(:two)
      straight_cards = Card.values[0..3] + [:ace]
    else
      first_card_index = Card.values.index(sorted_cards.first.value)
      straight_cards = Card.values[first_card_index..(first_card_index + 4)]
    end
    
    all_card_values == straight_cards
    
  end
  
  def is_straight_flush?
    is_straight? && is_flush?
  end
  
  def is_four_of_a_kind?
    @cards.each do |card|
      return true if card_count(card.value) == 4
    end
    
    false
  end
  
  def is_full_house?
    is_three_of_a_kind? && is_pair?
  end
  
  def is_three_of_a_kind?
    @cards.each do |card|
      return true if card_count(card.value) == 3
    end
    
    false
  end
  
  def is_pair?
    @cards.each do |card|
      return true if card_count(card.value) == 2
    end
    
    false
  end
  
  def is_two_pair?
    firstpair_value = nil
    secondpair_value = nil
    
    @cards.each do |card|
      if card_count(card.value) == 2
        firstpair_value = card.value unless firstpair_value
        secondpair_value = card.value if firstpair_value && firstpair_value != card.value
      end
    end
      
      firstpair_value && secondpair_value
  end
  
  def card_count(value)
    @cards.map(&:value).count(value)
  end
  
  def <=>(other_hand)
    return 0 if HAND_RANKS[rank] == HAND_RANKS[other_hand.rank]
    return 1 if HAND_RANKS[rank] > HAND_RANKS[other_hand.rank]
    return -1 if HAND_RANKS[rank] < HAND_RANKS[other_hand.rank]
  end
  
end
