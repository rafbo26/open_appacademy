class GuessingGame
  
  def initialize(num1, num2)
    @secret_num = rand(num1..num2)
    @num_attempts = 0
    @game_over = false
  end
  
  def num_attempts
    @num_attempts
  end
  
  def game_over?
    @game_over
  end
  
  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true
      puts "You win!"
    elsif num > @secret_num
      puts "Too big"
    elsif num < @secret_num
      puts "Too small"
    end
  end
      
  def ask_user
    print "Enter a number: "
    number = gets.chomp.to_i
    check_num(number)
  end
  
end
