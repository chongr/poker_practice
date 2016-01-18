class Player
    
    attr_reader :bankroll, :hand
    
    def self.buy_in(bankroll)
        Player.new(bankroll)
    end
    
    def initialize(bankroll)
        @bankroll = bankroll
        @hand = []
        @folded = false
    end
    
    def deal_in(hand)
        @hand = hand
    end
    
    def take_bet(amt)
        raise "not enough money" if amt > @bankroll
        @bankroll -= amt
        amt
    end
    
    def return_cards
        cards_to_return = @hand.cards
        @hand = nil
        cards_to_return
    end
    
    def receive_winnings(amt)
        @bankroll += amt
    end
    
    def fold
        @folded = true
    end
    
    def unfold
        @folded = false
    end
    
    def folded?
        if bankroll <= 0
            @folded = true
        end
        @folded
    end
    
end