class Array
  
  def my_each &prc
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
  
  def my_map &prc
    new_array = []
    
    self.my_each do |el|
      new_array << prc.call(el)
    end
    
    new_array
  end
  
  def my_select &prc
    new_array = []
    
    self.my_each do |el|
      new_array << el if proc.call
    end
    
    new_array
  end
  
  def my_inject &prc
    accum = self[0]
    
    self[1..-1].my_each do |el|
      accum = proc.call(accum, el)
    end
      
    accum
  end
  
  def my_sort! &prc
    sorted = false
    
    until sorted
      sorted = true
      self[0..-2].each_index do |i|
        #next if i == self.length - 1  
        case proc.call(self[i], self[i + 1])
        when -1
          next
        when 0
          next
        when 1
          self[i + 1], self[i] = self[i], self[i + 1]
          sorted = false
        end
      end
    end
    
    self
  end
  
  def my_sort &prc
    copy = self.dup
    copy.my_sort! &prc
  end
  
  
end



def eval_block(*args, &prc)
  unless prc.nil?
    prc.call(*args)
  else 
    raise 'no block given!'
  end
    
end

eval_block(1, 2, 3)