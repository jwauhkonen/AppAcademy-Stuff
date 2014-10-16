def median(integers)
  sorted = integers.sort

  if sorted.count % 2 == 1
    return sorted[sorted.count / 2]
  else
    return (sorted[(sorted.count / 2) - 1] + sorted[sorted.count / 2]) / 2.0
  end

end

array1 = [ 2, 4, 5, 6, 7, 9]

array2 = [ 2, 4, 5, 6, 8]

p median(array1)
p median(array2)
