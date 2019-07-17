class Ai_player

  attr_accessor :name, :loses, :lost_game
  attr_reader :word

  def initialize
    @names = ["Skynet", "Alpha", "Omega", "Cerebro", "HAL 9000", "C-3PO", "The Matrix", "The Red Queen", "JARVIS", "KITT"]
    @name = get_name
    @loses = 0
    @word = ""
    @lost_game = false
  end

  def get_name
    name = @names.sample
    @names.delete(name)
    name
  end

  def guess(fragment, players, dictionary)
    #sleep(2)
    words = find_all_words(dictionary, fragment)
    if words.length == 0
      return "challenge"
    elsif fragment.length == 0
      ("a".."z").to_a.sample
    else
      find_winning_word(words, fragment, players)
    end
    
  end
  
  def find_all_words(dictionary, fragment)
    words = {}
    dictionary.each do |word, length|
      if word[0...fragment.length] == fragment
        words[word] = length
      end
    end
    words
  end
  
  
  def find_winning_word(words, fragment, players)
    len = fragment.length
    letters = Hash.new(0)
    words.each do |word|
      if word.length == len + 1
        letters[word[len]] -= 99999999
      elsif (word.length - (len + 1)) % players == 0
        letters[word[len]] -= 1 
      else
        letters[word[len]] += 1 
      end
    end
    letters.key(letters.values.max)
  end
  
  
  def update_word
    @word = "GHOST"[0...@loses]
  end

end