class Array
  
  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el unless new_arr.include?(el) }
    new_arr 
  end
  
  def two_sum
    zero_sums = []
    self.each_index do |i|
      ((i + 1)...self.length).each do |j|
        zero_sums << [i, j] if self[i] + self[j] == 0
      end
    end
    
    zero_sums
  end

end