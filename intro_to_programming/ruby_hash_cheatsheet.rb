Hash Cheat Sheet
Here is a quick reference for the methods and operations we learned in the previous lectures!

Access
hash = { "name" => "App Academy", "color" => "red" }

p hash["color"]  # prints "red"
p hash["age"]    # prints nil

k = "color"
p hash[k]        # prints "red"

hash["age"] = 5
p hash           # prints {"name"=>"App Academy", "color"=>"red", "age"=>5}
Checking Existence
hash = { "name" => "App Academy", "color" => "red" }

p hash.has_key?("name")             # prints true
p hash.has_key?("age")              # prints false
p hash.has_key?("red")              # prints false

p hash.has_value?("App Academy")    # prints true
p hash.has_value?(20)               # prints false
p hash.has_value?("color")          # prints false
Hash Enumerable Methods
hash = { "name" => "App Academy", "color" => "red" }

hash.each { |key, val| p key + ', ' + val} # prints
# "name, App Academy"
# "color, red"

hash.each_key { |key| p key } # prints
# "name"
# "color"

hash.each_value { |val| p val } # prints
# "App Academy"
# "red"
Hash.new
  plain_hash = { }
  plain_hash["city"] = "SF"
  p plain_hash["city"]    # prints "SF"
  p plain_hash["country"] # prints nil

  hash_with_default = Hash.new("???")
  hash_with_default["city"] = "NYC"
  p hash_with_default["city"]    # prints "NYC"
  p hash_with_default["country"] # prints "???"



  def ae_count(str)
    hash = { "a"=>0, "e"=>0 }
    str.each_char do |ele|
      if hash.has_key?(ele)
        hash[ele] += 1
      end
    end
    return hash
  end
  
  puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
  puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}


  def element_count(arr)
    hash = Hash.new(0)
    arr.each do |ele|
      hash[ele] += 1
    end
    return hash
  end
  
  puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
  puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}



  def select_upcase_keys(hash)
    upcase = {}
    hash.each_key do |key|
      if key[1..-1] == key[1..-1].upcase
        upcase[key] = hash[key]
      end
    end
    return upcase
  end
  
  print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
  puts
  
  print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
  puts


  def hand_score(hand)
    cards = { "a"=>4, "k"=>3, "q"=>2, "j"=>1 }
    score = 0
    hand.each_char { |card| score += cards[card.downcase] }
    return score
  end
  
  puts hand_score("AQAJ") #=> 11
  puts hand_score("jJka") #=> 9