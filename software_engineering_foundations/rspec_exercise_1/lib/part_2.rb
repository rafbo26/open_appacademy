def hipsterfy(word)
  vowels = "aeiou"
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      word[i] = ""
      break
    end
    i -= 1
  end
  word
end

def vowel_counts (str)
  vowels = "aeiou"
  hash = Hash.new(0)
  str.each_char { |char| hash[char.downcase] += 1 if vowels.include?(char.downcase) }
  hash
end

def caesar_cipher(msg, num)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  msg = msg.split("").map do |char| 
    if alpha.include?(char)
      idx = (alpha.index(char) + num) % alpha.length
      alpha[idx]
    else
      char
    end
  end
  msg.join("")
end