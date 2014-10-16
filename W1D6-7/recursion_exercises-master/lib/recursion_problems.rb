#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  
  if array.empty?
    return 0
  elsif array.length == 1
    return array[0]
  end
  
  return sum_recur(array[0...-1]) + array[-1]
  

end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  
  if array.empty?
    return false
  end
  
  if array[-1] == target
    return true
  else
    return includes?(array[0...-1], target)
  end

end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  if array.empty?
    return 0
  end
  
  if array[-1] == target
    return num_occur(array[0...-1], target) + 1
  else
    return num_occur(array[0...-1], target)
  end
  
end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  if array.length == 1
    return false
  end
  
  if array[-1] + array[-2] == 12
    return true
  else
    return add_to_twelve?(array[0...-1])
  end
 
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  if array.empty?
    return array
  end
  
  if array.length == 1
    return true
  end
  
  if array[-1] < array[-2]
    return false
  else
    return sorted?(array[0...-1])
  end
 
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number)
  if number < 10
    return number
  end
  
  multiplier = 10
  
  until multiplier > number / 10
    multiplier *= 10
  end
  
  return ((number % 10) * multiplier) + reverse(number / 10) 
  
end

