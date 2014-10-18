require 'towers'
require 'stringio'


describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  
  describe "#towers" do
    it "builds three towers" do
      expect(game.towers.all? { |el| el.is_a?(Array) }).to be true
      expect(game.towers.count).to eq 3
    end
    
    it "are stacked high to low" do
      expect(game.towers.all? do |tower|
        tower == tower.sort.reverse
      end).to be true
    end
  end
  
  describe "#move" do
    it "take top disc and place on another tower" do
      game.move(0, 1)
      expect(game.towers[1]).to eq([1])
    end
    
    it " not allow larger discs on top of smaller discs" do
      game.move(0,1)
      my_proc = proc { game.move(0, 1) }
      expect { game.move(0,1) }.to raise_error
    end
  end
  
  describe "#game_over?" do
    
    it "recognizes first win state" do
      game = TowersOfHanoi.new [[], [3, 2, 1], []]
      expect(game.game_over?).to be true
    end
    
    it 'recognizes second win state' do
      game = TowersOfHanoi.new [[], [], [3, 2, 1]]
      expect(game.game_over?).to be true
    end
    
    it 'does not return false positive' do
      game = TowersOfHanoi.new [[3], [2], [1]]
      expect(game.game_over?).to be false
    end
    
  end
  
end