# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
  i = num / 2
  while i > 1
    return i if num % i == 0 && prime?(i)
    i -= 1
  end
  num
end

def prime?(num)
  (2...num).each { |factor| return false if num % factor == 0 }
  true
end
  

def unique_chars?(str)
  hash = Hash.new(0)
  str.each_char do |char|
    hash[char] += 1
    return false if hash[char] == 2
  end
  true
end


def dupe_indices(array)
  hash = Hash.new { |h, k| h[k] = [] }
  array.each.with_index do |ele, idx|
    hash[ele].push(idx)
  end
  hash.delete_if { |k, v| v.length < 2 }
end


def ana_array(arr1, arr2)
  arr1.each { |ele| return false if !arr2.include?(ele) }
  arr2.each { |ele| return false if !arr1.include?(ele) }
  true
end