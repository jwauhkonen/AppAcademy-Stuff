class Array
  def two_sum
    output = []

    i = 0
    while  i < self.count
      j = i + 1
      while j < self.count
        if self[i] + self[j] == 0
          output << [i, j]
        end
        j += 1
      end
      i += 1
    end
    output


  end

end

p [-1, 0, 2, -2, 1].two_sum
