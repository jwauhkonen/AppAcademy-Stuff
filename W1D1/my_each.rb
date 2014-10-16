class Array
  def my_each(&prc)
   self.map(&prc)
   self
  end
end


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
p return_value



#class Array
  def my_each(&proc)
    i = 0
    while i < self.count
      proc.call(self[i])
      i += 1
    end
    self
  end
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value
