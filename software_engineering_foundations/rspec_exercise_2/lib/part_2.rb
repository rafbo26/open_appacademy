def palindrome?(str)
  str.each_char.with_index do |char, i|
    idx = str.length - i - 1
    if char != str[idx]
      return false
    end
  end
  return true
end

def substrings(string)
  substr = []
  string.each_char.with_index do |char, i|
    temp = ""
    (i...string.length).each do |el|
      temp += string[el]
      substr << temp
    end
  end
  substr
end
    
def palindrome_substrings(string)
  palindr = []
  substr = substrings(string)
  substr.each do |sub|
    if palindrome?(sub) && sub.length > 1
      palindr << sub
    end
  end
  palindr
end