class Array
  def my_uniq
    output = []
    self.each do |item|
      unless output.include?(item)
        output << item
      end
    end
    output
  end
end

p [1, 2, 1, 3, 3].my_uniq
