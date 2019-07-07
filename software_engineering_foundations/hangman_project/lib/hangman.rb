class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  
  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end
  
  def get_matching_indices(char)
    (0...@secret_word.length).select { |i| @secret_word[i] == char }
  end
  
  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end
  
      
  def try_guess(char)
    if already_attempted?(char)
      puts "That has already been attempted"
      return false
    else
      @attempted_chars << char
      if @secret_word.include?(char)
        inds = get_matching_indices(char)
        fill_indices(char, inds)
      else
        @remaining_incorrect_guesses -= 1
      end
      true
    end
  end

  def ask_user_for_guess
    print "Enter a char: "
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      true
    else
      false
    end
  end



  # def game_over?
  #   if @remaining_incorrect_guesses <= 0 
  #     lose
  #     true
  #   elsif @guess_word.join("") == @secret_word
  #     win
  #     true
  #   end
  # end
  
  # def lose
  #   puts "You lose. Secret word: #{@secret_word}"
  # end
  
  # def win
  #   puts "The word was #{@guess_word.join("")}"
  #   puts "You win!"
  # end
  
  # def ask_user_for_guess
  #   print "Enter a char: "
  #   guess = gets.chomp
  #   if guess.length > 1 || guess.length == 0
  #     puts
  #     puts "Please enter single character"
  #   elsif already_attempted?(guess)
  #     puts
  #     puts "Already guessed #{guess}, try again"
  #   else
  #     @attempted_chars << guess
  #     try_guess(guess)
  #   end
  # end
  


  

  

  
end
