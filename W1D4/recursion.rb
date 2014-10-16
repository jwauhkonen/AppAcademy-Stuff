def subsets(array)
  total_sets = []
  if array.empty?
    total_sets << array
  else
    array.each_index do |i|
      total_sets << array[i]
      new_arr = array.dup
      new_arr.delete_at(i)
      total_sets << subsets(new_arr)
    end
  end
  
  total_sets.flatten.uniq
  
end

def make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  best_change = []

  coins.each do |coin|
    if amount >= coin
      coin_array = [coin] + make_change(amount - coin, coins)
      if best_change.empty?
        best_change = coin_array
      elsif coin_array.length < best_change.length
        best_change = coin_array
      end
    end
  end
  
  best_change
end


def binary_search(array, target, index = 0)
  array = array.dup.sort
  p array
  length = array.length
  middle_index = length / 2
  sample_value = array[middle_index]
  if target == sample_value
    middle_index + index
  elsif target < sample_value
    binary_search(array[0...middle_index], target, 0)
  else
    binary_search(array[(middle_index+1)..-1], target, middle_index+1)
  end
  
end

def fibonacci(num)
  
  
  if num == 0
    return []
  elsif num == 1
    return [1]
  elsif num == 2
    return [1, 1]
  else
    fibs = fibonacci(num - 1) << (fibonacci(num-1)[-1] + fibonacci(num-1)[-2])
    return fibs
  end
  
 
end

def fib_iterative(num)
  fibs = [1, 1]
  
  if num == 0
    fibs = []
  elsif num == 1
    fibs = [1]
  elsif num == 2
    fibs = [1, 1]
  else
    while fibs.length < num
      fibs << fibs[-1] + fibs[-2]
    end
  end
  
  fibs
end


def exp1(num, pow, count = 0)
  if pow == 0
    puts count
    return 1 
  end
  num * (exp1(num, pow - 1, count + 1))
end

def exp2(num, pow, count)
  return 1 if pow == 0
  return num if pow == 1
  puts count
  if pow % 2 == 0
    exp2(num, pow / 2) * exp2(num, pow / 2)
  else
    num * (exp2(num, (pow - 1) / 2) * exp2(num, (pow - 1) / 2))
  end
  
end

def range(first, last)
  if last - 1 == first
    return []
  else
    range(first, last - 1) << (last - 1)
  end
end

def sum_iterative(arr)
  total = 0
  
  arr.each do |num|
    total += num
  end
  
  total
end

def sum_recursive(arr)
  arr = arr.dup
  if arr.count == 1
    return arr[0]
  else
    arr.pop + sum_recursive(arr) 
  end
end



# class Array
#
#   def deep_dup
#     copy = []
#
#     self.each do |el|
#       if el.is_a?(Array)
#         copy << el.deep_dup
#       else
#         copy << el
#       end
#     end
#
#     copy
#   end
#
#   # [1, 3, 2, 5, 6, 4]
#   def merge_sort
#     if self.length <= 1
#       return self
#     end
#
#     first_half =  self[0...(self.length/2)].merge_sort
#     second_half = self[(self.length/2)..-1].merge_sort
#
#     return merge(first_half, second_half)
#   end
#
#   private
#   def merge(ary1, ary2)
#     result = []
#
#
#     # If both are empty, result = []
#     # If ary1 is empty,  result = ary2
#     # if ary2 is empty,  result = ary1
#     # If ary[1] > ary[2] result = [ary2[0], ary1[0]]
#     # Else               result = [ary1[0], ary2[0]]
#     if ary1.empty? && ary2.empty?
#         result
#     else
#       if ary1.empty?
#         result = ary2.merge_sort
#       elsif ary2.empty?
#         result = ary1.merge_sort
#       else
#         if ary1[0] < ary2[0]
#           result = ary1 + ary2
#         else
#           result = ary2 + ary1
#         end
#         while result.length < ary1.length + ary2.length
#           if ary1[0] < ary2[0] && !ary1.empty?
#             result << ary1[0]
#             ary1.delete_at(0)
#           else
#             result << ary2[0]
#             ary2.delete_at(0)
#           end
#
#       end
#     end
#
#     result
#   end
#
# end
#
#
#
