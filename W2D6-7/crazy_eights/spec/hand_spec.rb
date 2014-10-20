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
      expect(deck).to receive(:take).with(8).and_return(deck_cards)
      
      hand = Hand.deal_from(deck)
      
      hand.cards.should =~ deck_cards
    end
  end
  
  describe "play_card" do
    let(:deck) { double("deck") }
    let(:hand) do
      Hand.new([Card.new(:spades, :deuce), Card.new(:spades, :three)])
    end
    
    it "places a card on the discard pile" do
      expect(deck).to receive(:discard).with(Card.new(:spades, :deuce))
      
      hand.play_card(deck, [Card.new(:spades, :deuce)])
    end
    
    it "removes the card from the hand" do
      let(:hand) do
        Hand.new([Card.new(:spades, :deuce), Card.new(:spades, :three)])
      end
      
      expect(hand).to eq([Card.new(:spades, :three)])
      
      hand.play_card(deck, [Card.new(:spades, :deuce)])
    end
  end
      
end