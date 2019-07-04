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

p hipsterfy("tonic")
p hipsterfy("panther")
p hipsterfy("swimming")

p hipsterfy("rhythm")
p hipsterfy("my")


def vowel_counts (str)
  vowels = "aeiou"
  hash = Hash.new(0)
  str.each_char { |char| hash[char.downcase] += 1 if vowels.include?(char.downcase) }
  hash
end

p vowel_counts("code bootcamp")
p vowel_counts("williamsburg bridge")
p vowel_counts("WILLIAMSBURG bridge")


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

p caesar_cipher("apple", 1)
p caesar_cipher("apple", 2)
p caesar_cipher("hello", 5)
p caesar_cipher("zebra", 4)
p caesar_cipher("whoa", 26)
p caesar_cipher("whoa", 52)

p caesar_cipher("123 _-!?@%", 3)
p caesar_cipher("hello world!", 1)
p caesar_cipher("welcome to week 3, day 1", 2)