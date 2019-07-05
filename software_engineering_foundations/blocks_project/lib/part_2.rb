def all_words_capitalized?(words)
  words.all? { |word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase }
end

def no_valid_url?(urls)
  valid_ends = ['com', 'net', 'io', 'org']
  urls.none? { |url| valid_ends.include?(url.split(".")[1]) }
end

def any_passing_students?(students)
  students.any? { |student| average(student[:grades]) > 75 }
end

def average(array)
  array.sum / array.length
end