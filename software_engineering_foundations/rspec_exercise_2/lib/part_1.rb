def partition(array, num)
  less = array.select { |el| el < num }
  more = array.select { |el| el >= num }
  [less, more]
end

p partition([11, 5, 13, 2, 3], 7)
p partition([1, 2, 4, 3, 5, 7], 5)
p partition([1, 2, 4, 3], 0)


def merge(hash1, hash2)
  hash = {}
  hash1.each { |k, v| hash[k] = v }
  hash2.each { |k, v| hash[k] = v }
  hash
end

hash_1 = {"a"=>10, "b"=>20}
hash_2 = {"c"=>30, "d"=>40, "e"=>50}
p merge(hash_1, hash_2)
p "------"

hash_1 = {"a"=>10, "b"=>20}
hash_2 = {"c"=>30, "b"=>7}
p merge(hash_1, hash_2)
p "------"

hash_1 = {"a"=>10, "b"=>20}
hash_2 = {"c"=>30, "d"=>40, "e"=>50}
p merge(hash_1, hash_2)
p "------"
p hash_1
p hash_2
p "------"


def censor(sent, arr)
  vowels = "aeiou"
  sent = sent.split(" ").map do |ele|
    if arr.include?(ele.downcase)
      ele.each_char.with_index { |char, i| ele[i] = "*" if vowels.include?(char.downcase) }
    else
      ele
    end
  end
  sent.join(" ")
end

p censor("Gosh darn it", ["gosh", "darn", "shoot"])
p censor("SHUT THE FRONT DOOR", ["door"])


def power_of_two?(num)
  reminder = 0.0
  while reminder == 0.0 && num != 1.0
    reminder = num % 2
    num = num / 2.0
  end
  if num == 1
    true
  else
    false
  end
end

p power_of_two?(16)
p power_of_two?(32)
p power_of_two?(64)
p power_of_two?(1)

p power_of_two?(6)
p power_of_two?(7)
p power_of_two?(28)
p power_of_two?(100)
