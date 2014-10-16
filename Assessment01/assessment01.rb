def is_prime?(num)
  
  (2...num).each do |divisor|
    if num % divisor == 0
      return false
    end
  end
  
  true
end

def primes(count)
  primes = []
  
  i = 2
  while primes.length < count
    primes << i if is_prime?(i)
    i += 1
  end
  
  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  if num == 1
    return [1]
  end
  
  return factorials_rec(num - 1) << factorials_rec(num - 1)[-1] * num
  
end

class Array
  def dups
    num_count = Hash.new { |h, k| h[k] = [] }
    
    self.each_with_index do |num, i|
      num_count[num] << i
    end
    
    num_count.select { |num, count| count.length > 1 }
  end
end

class String
  def symmetric_substrings
    substrings = []
    
    self.length.times do |i|
      
      j = i + 1
      while j < self.length
        substrings << self[i..j]
        j += 1
      end
    end
    
    substrings.select { |substring| substring == substring.reverse }
  end
end

class Array
  def bubble_sort(&blk)
    new_array = self.dup
    new_array.bubble_sort!(&blk)
  end

  def bubble_sort!(&blk)
    sorted = false
    
    blk = Proc.new { |num1, num2| num1 <=> num2 } unless blk
    
    until sorted == true
      sorted = true
      
      self.each_index do |i|
        if i == self.length - 1
          next
        end
        
        if blk.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    
    self
  end
end

