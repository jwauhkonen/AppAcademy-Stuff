def factors(num)
  factors = []
  
  (1..num).each do |divisor|
    if num % divisor == 0
      factors << divisor
    end
  end
  
  factors
end

def fibs_rec(count)
  if count == 1
    return [0]
  elsif count == 2
    return [0, 1]
  end
  
  last_fib = fibs_rec(count - 1)
  
  return last_fib << (last_fib[-1] + last_fib[-2])
  
end

class Array
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def bubble_sort!(&prc)
    sorted = false
    
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless prc # TA: Nice. Could also use ||=
    
    until sorted
      sorted = true
      
      self.each_index do |i|
        if i == self.length - 1
          next
        end
        
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    
    self
  end
end

class Array
  def two_sum
    pairs = []
    
    self.each_index do |i|
      
      j = i + 1
      while j < self.length # TA: Could also use (i + 1...self.length).each do |j|
        if self[i] + self[j] == 0
          pairs << [i, j]
        end
        
        j += 1
      end
    end
    
    pairs
  end
end

class String
  def subword_counts(dictionary)
    subword_counts = Hash.new { |h,k| h[k] = 0 }
    
    self.length.times do |i|
      
      j = i # TA: See above. Avoid manually incrementing like this.
      while j < self.length
        subword_counts[self[i..j]] += 1 if dictionary.include?(self[i..j])
        j += 1
      end
    end
    
    subword_counts
  end
end

# TA: Nice job, but you can let Ruby do more of the work for you.