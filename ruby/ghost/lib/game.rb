require_relative "./player"

class Game

  def initialize
    @players = get_players
    @current_player = @player_1
    @previous_player = @player_2
    @dictionary = populate_dictionary
    @fragment = ""
    @loses = {}
  end

  def get_players
    print "Enter number of players: "
    player_qty = gets.chomp.to_i
    players = {}
    (1..player_qty).each do |i|
      
    end
  end

  def populate_dictionary
    dict = {}
    File.readlines("dictionary.txt").each { |line| dict[line.chomp] = line.chomp.length }
    dict
  end
  
  def next_player!(current_player, next_player)
    @previous_player = current_player
    @current_player = next_player
  end
  
  def play_round
    round_over = false
    until round_over
      take_turn(@current_player)
      round_over = !valid_play?(@fragment)
      next_player!(@current_player, @previous_player)
    end
    end_round
  end
  
  def take_turn(player)
    puts
    puts "Player: #{player.name}"
    puts "Current fragment: #{@fragment}"
    alpha = ("a".."z")
    guess = player.guess
    if alpha.include?(guess)
      @fragment = @fragment + guess
    else
      puts "Invalid character. Please enter only single A-Z characters"
      take_turn(player)
    end
  end
  
  def valid_play?(fragment)
    if @dictionary.has_key?(fragment)
      puts "Game over, you spelled word #{fragment}"
      return false
    end
    @dictionary.each do |word, v|
      if word[0...fragment.length] == fragment
        return true
      end
    end
    puts "Game over, #{fragment} doesn't exist in dictionary"
    return false
  end
  
  def end_round
    
    
  end
  
end

game = Game.new

game.play_round
