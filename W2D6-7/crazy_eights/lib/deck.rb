require_relative 'card'

class Deck
  
  attr_accessor :discard_pile
  
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end
  
  def initialize(cards = Deck.all_cards)
    @cards = cards
    @discard_pile = []
  end
  
  def count
    @cards.length
  end
  
  def take(n = 1)
    @cards.shift(n)
  end
  
  def discard(card)
    
    if discard_pile.empty? || card.value == :eight
      @discard_pile += card
    else
      top_card = @discard_pile[-1]
      
      if top_card.suit != card.suit && top_card.value != card.value
        raise "can't play that card" 
      else
        @discard_pile += card
      end
    end
  end
  
    
  
end