# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
  def span
    return nil if self.length == 0 
    self.max - self.min
  end
  
  def average
    return nil if self.length == 0
    self.sum / (self.length * 1.0)
  end
  
  def median
    return nil if self.length == 0 
    array = self.sort
    if self.length.odd?
      array[length/2]
    else
      (array[length/2 - 1] + array[length/2]) / 2.0
    end
  end
  
  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end
  
  def my_count(arg)
    self.select { |ele| ele == arg }.length
  end
  
  def my_index(arg)
    return nil if !self.include?(arg)
    self.each.with_index { |ele, i| return i if ele == arg }
  end
  
  def my_uniq
    result = []
    self.each { |ele| result << ele if !result.include?(ele) }
    result
  end
  
  def my_transpose
    array = Array.new(self.length) { Array.new(self.length) }
    self.each.with_index do |arr, i|
      arr.each.with_index do |subarr, j|
        array[j][i] = subarr
      end
    end
    array
  end
  
end
