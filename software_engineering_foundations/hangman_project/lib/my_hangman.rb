class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def initialize
    @secret_word = ""
    @guess_word = []
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
    random_word
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def attempted_chars
    @attempted_chars
  end
  
  def guess_word
    @guess_word
  end
  
  def random_word
    len = DICTIONARY.length
    idx = rand(0...len)
    @secret_word = DICTIONARY[idx]
    (@secret_word.length).times { @guess_word << "_" }
  end
  
  def game_over?
    if @remaining_incorrect_guesses <= 0 
      lose
      true
    elsif @guess_word.join("") == @secret_word
      win
      true
    end
  end
  
  def lose
    puts "You lose. Secret word: #{@secret_word}"
  end
  
  def win
    puts "The word was #{@guess_word.join("")}"
    puts "You win!"
  end
  
  def ask_user_for_guess
    print "Enter a char: "
    guess = gets.chomp
    if guess.length > 1 || guess.length == 0
      puts
      puts "Please enter single character"
    elsif already_attempted?(guess)
      puts
      puts "Already guessed #{guess}, try again"
    else
      @attempted_chars << guess
      try_guess(guess)
    end
  end
  
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end
    
  def try_guess(char)
    if @secret_word.include?(char)
      indices = get_matching_indices(char)
      fill_indices(char, indices)
    else
      @remaining_incorrect_guesses -= 1
    end
  end
  
  def get_matching_indices(char)
    (0...@secret_word.length).select { |i| @secret_word[i] == char }
  end
  
  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end
  
end
