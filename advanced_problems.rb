# Map By Name
# Write a method map_by_name  that takes in an array of hashes and returns a new array containing the names of each hash

def map_by_name(arr)
  return arr.map { |ele| ele["name"] }
end


pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
puts

countries = [
 {"name"=>"Japan", "continent"=>"Asia"},
 {"name"=>"Hungary", "continent"=>"Europe"},
 {"name"=>"Kenya", "continent"=>"Africa"},
]
print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
puts


# Map By Key
# Write a method map_by_key that takes in an array of hashes and a key string. The method should returns a new array containing the values from each hash for the given key.

def map_by_key(arr, key)
  return arr.map { |ele| ele[key] }
end

locations = [
  {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
]

print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
puts
print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
puts


# Yell Sentence
# Write a method yell_sentence that takes in a sentence string and returns a new sentence where every word is yelled. See the examples. Use map to solve this.

def yell_sentence(sent)
  return sent.split(" ").map { |ele| ele.upcase + "!" }.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"


# Whisper Words
# Write a method whisper_words that takes in an array of words and returns a new array containing a whispered version of each word. See the examples. Solve this using map :).

def whisper_words(words)
  return words.map { |ele| ele.downcase + "..." }
end

print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
puts


# O Words
# Write a method o_words that takes in a sentence string and returns an array of the words that contain an "o". Use select in your solution!

def o_words(sentence)
  return sentence.split(" ").select { |ele| ele.include?("o") }
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts






