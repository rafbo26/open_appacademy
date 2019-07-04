def partition(array, num)
  less = array.select { |el| el < num }
  more = array.select { |el| el >= num }
  [less, more]
end

def merge(hash1, hash2)
  hash = {}
  hash1.each { |k, v| hash[k] = v }
  hash2.each { |k, v| hash[k] = v }
  hash
end




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