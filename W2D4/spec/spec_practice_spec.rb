require 'rspec'
require 'spec_practice'

describe '#hello_world' do
  it "returns 'Hello, World!'" do
    expect(hello_world).to eq("Hello, World!")
  end
end

describe Integer do
  describe '#to_s' do
    it 'returns string representations of integers' do
      expect(5.to_s).to eq('5')
    end
  end
end

describe "Cat" do
  let(:cat) { Cat.new("Sennacy") }
  
  describe "name property" do
    it "returns something we can manipulate" do
      cat.name = "Rocky"
      expect(cat.name).to eq("Rocky")
    end
    
    it "does not persist state" do
      expect(cat.name).to eq("Sennacy")
    end
  end
end