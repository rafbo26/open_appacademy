# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)

    min = [num_1, num_2].min
    i = min
    while i
        return i if i % num_1 == 0 && i % num_2 == 0
        i += min
    end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new { |k, v| k[v] = 0 }
    i = 0
    while i < str.length - 1
        bigrams[str[i..i + 1]] += 1
        i += 1
    end
    bigrams.key(bigrams.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new = {}
        self.each { |k, v| new[v] = k }
        new
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        self.count { |ele_1| self.any? { |ele_2| ele_1 + ele_2 == num } } / 2
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end


p actual = [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s }
