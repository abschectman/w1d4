require "byebug"

def range(start, last)
  return [] if last < start

  [start] + range(start + 1, last) 
end



def sum_array(array)
  return 0 if array.empty?

  array[0] + sum_array(array[1..-1])

end

def sum_array_iter(array)
  sum = 0
  array.each {|ele| sum += ele}
  sum
end

def exponent(base, power)
  return 1 if power == 0

  base * exponent(base, power - 1)
end

def exponent2(base, power)
  return 1 if power == 0

  even_power = exponent2(base, power/2)
  odd_power = exponent2(base, (power - 1) / 2)
  if power.even?
    even_power * even_power
  else
    base * odd_power * odd_power
  end
end
p exponent2(2, 4)

def deep_dup(array)
  # not an array
  return array if !array.is_a?(Array)
  

  # is an array
  duplicate = []

  array.each do |el| 
    duplicate << deep_dup(el) 

  end

  duplicate
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

p deep_dup(robot_parts)


def fib(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_fibs = fibs(n-1)
  new_fib = prev_fib[-1] + prev_fib[-2]
  prev_fibs += [new_fib]
end

def fib_iter(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  seq = [0,1]
  while seq.length < n
    seq << seq[-1] + seq[-2]
  end
  seq
end

def binary_search(arr, target)
  left = 0
  right = arr.length - 1
  # if left > right
  #   return nil
  # end
  return nil if arr.empty?
  # debugger
  # return nil if arr.length  <= 0  
  mid = arr.length/2
  # return mid if arr[mid] == target
  return mid if arr[mid] == target
    # debugger
    
  if target < arr[mid]
    # debugger

    return binary_search(arr[left...mid], target)
    
  else 
    # debugger
    
    # return (mid + 1) + binary_search(arr[mid+1..right], target)
    sub_answer = binary_search(arr[mid+1..right],target)
    sub_answer.nil? ? nil : (mid+1) + sub_answer
  end
  
  

end


# p binary_search([1,2,3,4,5,6,7] ,1)
# p binary_search([1,2,3,4,5,6,7] ,7)
p binary_search([1,2,3,4,5,6,7] ,9)
p binary_search([1,3,4,5,7] ,2)
#recursion_exercises.rb

def merge_sort(arr)
  return arr if arr.length <=1 

  left = 0 
  right = arr.length-1
  mid = arr.length/ 2 
  # debugger
  left_side = arr[left..mid-1]
  right_side = arr[mid..right]
  # debugger
  sorted_left = merge_sort(left_side)
  sorted_right = merge_sort(right_side)
  # debugger
  merge(sorted_left,sorted_right)


end

def merge(a,b)

  # return arr if a.empty? & b.empty?
  # if a.empty? && b.empty?
  #   return arr    
  # elsif b.empty?
  #   return arr += a 
  # elsif a.empty?
  #   return arr += b
  # end

  # arr = [] 
  # if a[0] < b[0]
  #   arr<< a[0]
  #   merge(a[1..-1],b)
  # else 
  #   arr << b[0]
  #   merge(a,b[1..-1])
  # end

  # arr
  output = [] 

  while !( a.empty? || b.empty? )
    # debugger
    if a[0] < b[0]
      # debugger
      output << a.shift
    else
      # debugger
      output << b.shift
    end

# test comment

  end

  output + a + b    





  # i = 0 
  # j = 0 
  # while (i < a.length) || (j < b.length)
  #   debugger
     
  #   if a[i] < b[j]
  #     debugger
  #     output << a[i]
  #     i+=1 
  #   else 
  #     debugger
  #     output << b[j]
  #     j+=1
  #   end
  # end

  # output + a[i..-1] + b[j..-1]

  # if a.length < b.length 
  #   output += a[i..-1]
  # else 
  #   output += b[j..-1]
  # end
  
end

# p merge_sort([5,2,3,4,4,6,7,8,89,5,3,3,2,3,4].shuffle)
# p merge([23,50,90],[56,92])

# load "recursion_exercises.rb"