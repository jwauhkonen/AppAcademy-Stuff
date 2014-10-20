require 'card'
require 'deck'

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }
    
    # its(:count) { should == 52 }
    
    it "returns all cards without duplicated" do
      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .uniq
        .count
      expect(deduped_cards).to eq(52)
    end
  end
  
  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end
  
  describe "#initialize" do
    it "by default fills itself with 52 cards" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end
    
    it "can be initialized with an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end
  
  let(:deck) do
    Deck.new(cards.dup)
  end
  
  it "does not expose its cards directly" do
    expect(deck).not_to respond_to(:cards)
  end
  
  describe "#take" do
    # **use the front of the cards array as the top**
    it "takes a card off the top of the deck" do
      expect(deck.take).to eq(cards[0])
    end
    
    it "removes a card from deck on take" do
      deck.take
      expect(deck.count).to eq(2)
    end
    
  end
  
  describe "#discard_pile" do
    let(:discard_pile) { deck.discard_pile }
    
    it "is empty to begin with" do
      expect(discard_pile.length).to eq(0)
    end
    
  end
  
  
  describe "#discard" do
    let(:discard_pile) { deck.discard_pile }

    it "places a card on the discard pile" do
      deck.discard(Card.new(:clubs, :six))
      expect(discard_pile.length).to eq(1)
    end
    
    it "allows a card of the same value" do
      deck.discard_pile = [Card.new(:clubs, :six)]
      deck.discard(Card.new(:hearts, :six))
      expect(discard_pile.length).to eq(2)
    end
    
    it "allows a card of the same suit" do
      deck.discard_pile = [Card.new(:hearts, :six)]
      deck.discard(Card.new(:hearts, :five))
      expect(discard_pile.length).to eq(2)
    end
    
    it "allows an eight no matter what" do
      deck.discard_pile = [Card.new(:clubs, :six)]
      deck.discard(Card.new(:diamonds, :eight))
      expect(discard_pile.length).to eq(2)
    end
    
    it "does not allow a card of a different value and suit" do
      deck.discard_pile = [Card.new(:clubs, :six)]
      expect do
        deck.discard(Card.new(:spades, :three))
      end.to raise_error("can't play that card")
    end


    it "adds a new card to the top of the discard pile" do
      deck.discard_pile = [Card.new(:hearts, :six)]
      deck.discard(Card.new(:hearts, :five))
      deck.discard(Card.new(:diamonds, :eight))
      
      expect(Card.new(:diamonds, :eight)).to eq(discard_pile[-1])
      expect(Card.new(:hearts, :five)).to eq(discard_pile[-2])
      expect(Card.new(:hearts, :six)).to eq(discard_pile[-3])
    end
  end
end