class Array
  
  def subsets
    total_sets = []
    
    if self.length > 2
      return self
    end
    
    self.each_index do |i|
      new_arr = self.dup
      new_arr.delete_at(i)
      total_sets << new_arr.subsets
    end
    
    total_sets
  end
  
  
end



p [1, 2, 3].subsets