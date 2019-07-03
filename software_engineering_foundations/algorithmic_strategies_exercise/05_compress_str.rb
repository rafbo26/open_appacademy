# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  compressed = ''
  counter = 1
  (0...str.length).each do |i|
    if str[i] == str[i + 1]
      counter += 1
    else
      if counter != 1
        compressed += counter.to_s + str[i]
      else
        compressed += str[i]
      end
    counter = 1
    end
  end
  compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
