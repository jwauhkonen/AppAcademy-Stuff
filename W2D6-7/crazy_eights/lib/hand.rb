class Hand
  
  
  def self.deal_from(deck)
    Hand.new(deck.take(8))
  end
  
  attr_accessor :cards
  
  def initialize(cards)
    @cards = cards
  end
  
  
  
  
  
  
  
end