# My each
# Extend the Array class to include a method named my_each that takes a block, 
# calls the block on every element of the array, and returns the original array. 
# Do not use Enumerable's each method. I want to be able to write:

# My Select
# Now extend the Array class to include my_select that takes a block and returns 
# a new array containing only elements that satisfy the block. Use your my_each method!

# My Reject
# Write my_reject to take a block and return a new array excluding elements that satisfy the block.

# My Any
# Write my_any? to return true if any elements of the array satisfy the block and my_all? to 
# return true only if all elements satisfy the block.

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing self.length elements. 
# Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged 
# elements at that index. If the size of any argument is less than self, nil is returned for that location.

# My Rotate
# Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. 
# If a negative value is given, the array is rotated in the opposite direction.

# My Join
# my_join returns a single string containing all the elements of the array, separated by the given string 
# separator. If no separator is given, an empty string is used.

# My Reverse
# Write a method that returns a new array containing all the elements of the original array in reverse order.

class Array
  
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
  
  def my_select(&prc)
    selected = []
    self.my_each { |el| selected << el if prc.call(el) }
    selected
  end
  
  def my_reject(&prc)
    self.my_select { |el| !prc.call(el) }
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end
  
  def my_all?(&prc)
    self.my_each { |el| return false if !prc.call(el) }
    true
  end
  
  def my_flatten
    p self
    return [self] if !self.kind_of?(Array)
    flattened = []
    self.my_each { |el| flattened += el.my_flatten }
    flattened
  end
  
  def my_zip(*arg)
    zip = []
    (0...self.length).each do |i|
      sub_zip = []
      sub_zip << self[i]
      arg.each do |ele|
        sub_zip << ele[i]
      end
      zip << sub_zip
    end
    zip
  end
  
  def my_rotate(times = 1)
    self.map.with_index { |el, i| el = self[(i + times) % self.length] } 
  end
  
  def my_join(separator = "")
    joined = ""
    self.each.with_index do |el, i| 
      joined += el + separator
      if i == self.length - 2
        joined += self[-1]
        break
      end
    end
    joined
  end
  
  def my_reverse
    self.map.with_index { |el, i| el = self[-(i + 1)] }
  end
  
end


