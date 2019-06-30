  def is_palindrome(word)
    i = 0
    reversed = ''
    while i < word.length
      reversed = word[i] + reversed
        i += 1
    end
    return word == reversed
  end
  
  puts is_palindrome("racecar")  # => true
  puts is_palindrome("kayak")    # => true
  puts is_palindrome("bootcamp") # => false



  def even_nums(max)
    even = []
    i = 0
    while i <= max
      even << i
        i += 2
    end
    return even
  end
  
  print even_nums(10) # => [0, 2, 4, 6, 8, 10]
  puts
  print even_nums(5)  # => [0, 2, 4]

  def range(min, max)
    minMax = []
    i = min
    while i <= max
      minMax << i
      i += 1
    end
    return minMax
  end
  
  print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
  puts
  print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]


  def odd_range(min, max)
    odds = []
    i = min
    while i <= max
      if i % 2 == 1
        odds << i
      end
      i += 1
    end
    return odds
  end
  
  print odd_range(11, 18) # => [11, 13, 15, 17]
  puts
  print odd_range(3, 7)   # => [3, 5, 7]

  def reverse_range(min, max)
    nums = []
    i = max
    while i > min
      if
        i == max
        i -= 1
        next
      end
      nums << i
      i -= 1
    end
    return nums
  end
  
  print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
  puts
  print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]


  def first_half(array)
    half = []
    i = 0
    max = array.length - (array.length / 2)
    while i < max
      half << array[i]
      i += 1
    end
    return half
    
  end
  
  print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
  puts
  print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]


  def factors_of(num)
    array = []
    i = 1
    while i <= num
      if num % i == 0
        array << i
      end
      i += 1
    end
    return array
  end
  
  print factors_of(3)   # => [1, 3]
  puts
  print factors_of(4)   # => [1, 2, 4]
  puts
  print factors_of(8)   # => [1, 2, 4, 8]
  puts
  print factors_of(9)   # => [1, 3, 9]
  puts
  print factors_of(16)  # => [1, 2, 4, 8, 16]


  def select_odds(numbers)
    array = []
    i = 0
    while i < numbers.length
      
      if numbers[i] % 2 == 1
        array << numbers[i]
      end
      i += 1
    end
    return array
  end
  
  print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
  puts
  print select_odds([2, 4, 6])            # => []


  def select_long_words(words)
    long = []
    i = 0
    while i < words.length
      if words[i].length > 4
        long << words[i]
      end
    i += 1
    end
    return long
  end
  
  print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
  puts
  print select_long_words(["keep", "coding"])                               # => ["coding"]



  def sum_elements(arr1, arr2)
    sumArr = []
    i = 0
    while i < arr1.length
      sumArr << arr1[i] + arr2[i]
      i += 1
    end
    return sumArr
  end
  
  print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
  puts
  print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]


  def fizz_buzz(max)
    array = []
    i = 1
    while i < max
      if (i % 4 == 0 || i % 6 == 0) && !(i % 4 == 0 && i % 6 == 0)
        array << i
      end
      i += 1
    end
    return array
  end
  
  print fizz_buzz(20) # => [4, 6, 8, 16, 18]
  puts
  print fizz_buzz(15) # => [4, 6, 8]







