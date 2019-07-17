require "byebug"

class Minimax

  attr_accessor :name, :loses, :lost_game
  attr_reader :word

  def initialize
    @name = "Skynet"
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
    #debugger
    words = find_all_words(dictionary, fragment)
    if words.length == 0
      return "challenge"
    elsif fragment.length == 0
      ("a".."z").to_a.sample
    else
      find_winning_word(words, fragment, players)
    end
    
  end
  

  def minimax(fragment, words, max_player)
    words = find_all_words(words, fragment)
    chars = find_all_chars(words, fragment)
    return "score" if words.length == 0
    if max_player
      max_eval = -999999999
      max_player = false
      chars.each do |char| 
        eval = minimax(fragment + char, words, max_player)
        max_eval = [max_eval, eval].max
      end
      max_eval
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
  
  def find_all_chars(words, fragment)
    len = fragment.length
    char = []
    words.each_key do |word|
        char << word[len]
      end
    end
    char
  end
  
  
  def update_word
    @word = "GHOST"[0...@loses]
  end

end

minimax = Minimax.new