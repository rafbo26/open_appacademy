Array Enumerable Methods

people = ["Candace", "Jon", "Jose"]

# iterate over elements of an array using each

people.each { |person| puts person } # prints

# Candace

# Jon

# Jose

# iterate over elements of an array with index using each_with_index

people.each_with_index do |person, i|
puts person
puts i
puts "-----"
end # prints

# Candace

# 0

# -----

# Jon

# 1

# -----

# Jose

# 2

# -----

String Enumerable methods

greeting = "hello"

# iterate over characters of a string using each_char

greeting.each_char { |char| puts char } # prints

# h

# e

# l

# l

# o

# iterate over characters of a string with index using each_char.with_index

greeting.each_char.with_index do |char, i|
puts char
puts i
puts "---"
end # prints

# h

# 0

# ---

# e

# 1

# ---

# l

# 2

# ---

# l

# 3

# ---

# o

# 4

# ---

Other

# repeat a block using times

3.times do
puts "hi"
end # prints

# hi

# hi

# hi

# specify a range of numbers using (start..end) or (start...end)

# including end

(2..6).each {|n| puts n} # prints

# 2

# 3

# 4

# 5

# 6

# excluding end

(2...6).each {|n| puts n} # prints

# 2

# 3

# 4

# 5


# all?
# Return true when all elements result in true when passed into the block.

p [2, 4, 6].all? { |el| el.even? }  # => true
p [2, 3, 6].all? { |el| el.even? }  # => false



# any?
# Return true when all at least one element results in true when passed into the block.

p [3, 4, 7].any? { |el| el.even? }  # => true
p [3, 5, 7].any? { |el| el.even? }  # => false



# none?
# Return true when no elements of result in true when passed into the block.

p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false




# one?
# Return true when exactly one element results in true when passed into the block.

p [1, 4, 5].one? { |el| el.even? }  # => true
p [1, 4, 6].one? { |el| el.even? }  # => false
p [1, 3, 5].one? { |el| el.even? }  # => false





# count
# Return a number representing the count of elements that result in true when passed into the block.

p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }     



# => 0



sum
Return the total sum of all elements

p [1, -3, 5].sum   # => 3



max and min
Return the maximum or minimum element

p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil
flatten
Return the 1 dimensional version of any multidimensional array

multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]