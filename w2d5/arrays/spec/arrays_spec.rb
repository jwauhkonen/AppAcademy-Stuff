require 'arrays'

describe Array do
  let (:array) { Array.new }
  
  describe "#my_uniq" do
    it "might return a new array of only unique values" do
      array = [1, 2, 3 , 4, 4, 5, 5, 6, 6]
      expect(array.my_uniq).to eq([1, 2, 3, 4, 5, 6])
    end
  end
  
  describe "#two_sum" do
    it "finds indices of pairs that add to 0" do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
    
    it "lists pairs in order" do
      array = [0, -4, 3, 4, 2, -3]
      ts_array = array.two_sum
      expect(ts_array.index([1, 3])).to be < ts_array.index([2, 5])
    end
  end
end
