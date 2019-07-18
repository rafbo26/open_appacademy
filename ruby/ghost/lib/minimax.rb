require "byebug"

class Minimax

  attr_accessor :name, :loses, :lost_game


  def initialize
    @name = "Skynet"
    @loses = 0
    @word = ""
    @lost_game = false
    @players
    @choice = ""
  end

  def get_name
    name = @names.sample
    @names.delete(name)
    name
  end

  def guess(fragment, players, dictionary)
    @players = players
    #sleep(2)
    words = find_all_words(dictionary, fragment)
    if words.length == 0
      return "challenge"
    elsif fragment.length == 0
      ("a".."z").to_a.sample
    else
      minimax(fragment, words, true, 0)
      @choice
    end
    
  end
  
  def score(fragment, step)
    len = fragment.length - step
    if (fragment.length - (len + 1)) % @players == 0
      return -10
    else
      return 10
    end
  end
  
  def minimax(fragment, words, max_player, step)
    words = find_all_words(words, fragment)
    chars = find_all_chars(words, fragment)
    moves = []
    scores = []
    return score(fragment, step) if words.has_key?(fragment)
    chars.each do |char| 
      max_player = step % @players == 0
      scores.push minimax(fragment + char, words, max_player, step + 1)
      moves.push char
    end
    if max_player
      max_index = scores.each_with_index.max[1]
      @choice = moves[max_index]
      return scores[max_index]
    else
      min_index = scores.each_with_index.min[1]
      @choice = moves[min_index]
      return scores[min_index]
    end
  end

  def find_all_words(dictionary, fragment)
    words = {}
    dictionary.each_key do |word|
      if word[0...fragment.length] == fragment
        words[word] = word.length
      end
    end
    words
  end
  
  def find_all_chars(words, fragment)
    len = fragment.length
    char = []
    words.each_key do |word|
      char << word[len] if word.length > len
    end
    char.uniq
  end
  
  
  def update_word
    @word = "GHOST"[0...@loses]
  end

end

minimax = Minimax.new