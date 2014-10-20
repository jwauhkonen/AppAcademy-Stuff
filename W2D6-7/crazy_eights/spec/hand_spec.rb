require 'card'
require 'hand'

describe Hand do
  describe "::deal_from" do
    it "deals a hand of eight cards" do
      deck_cards = [
        Card.new(:spades, :deuce),
        Card.new(:spades, :three),
        Card.new(:spades, :four),
        Card.new(:spades, :five),
        Card.new(:spades, :six),
        Card.new(:spades, :seven),
        Card.new(:spades, :eight),
        Card.new(:spades, :nine)
      ]
      
      deck = double("deck")
      deck.should_receive(:take).with(8).and_return(deck_cards)
      
      hand = Hand.deal_from(deck)
      
      hand.cards.should =~ deck_cards
    end
  end
  
  
  
  
  
  
end