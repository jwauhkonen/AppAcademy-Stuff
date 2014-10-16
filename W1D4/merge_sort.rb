def merge_sort(array)
  
  if array.length < 2
    return array
  end
  
  left_half = array[0...(array.length/2)]
  right_half = array[(array.length/2)..-1]
  
  return merge(merge_sort(left_half), merge_sort(right_half))
  
end


def merge(left_half, right_half)
  merged_array = []
  
  until left_half.empty? || right_half.empty?
    merged_array << ((left_half.first < right_half.first) ? 
                    left_half.shift : right_half.shift)
  end
  
  merged_array + left_half + right_half

  
end

p merge_sort([])
p merge_sort([1])
p merge_sort([2, 1])
p merge_sort([2, 1, 5, 3, 4])
p merge_sort([3, 1, 4, 6, 2, 2, 3, 5, 7, 2])