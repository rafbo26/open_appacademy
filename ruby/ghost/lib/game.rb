require_relative "./player"

class Game

  def initialize
    @loses = {}
    @players = get_players
    @players_num = @players.length
    @current_player = @players[0]
    @previous_player = @players[-1]
    @dictionary = populate_dictionary
    @fragment = ""
    @round = 1
    @challenged = false
  end

  def get_players
    print "Enter number of players: "
    player_qty = gets.chomp.to_i
    players = []
    (1..player_qty).each do |i|
      print "Enter name of Player #{i}: "
      name = gets.chomp
      player = Player.new(name)
      players << player
      @loses[player.name] = 0
    end
    players
  end

  def populate_dictionary
    dict = {}
    File.readlines("dictionary.txt").each { |line| dict[line.chomp] = line.chomp.length }
    dict
  end
  
  def next_player!(current_player, previous_player)
    curr_player_idx = (@players.index(current_player) + 1) % @players_num
    @previous_player = current_player
    @current_player = @players[curr_player_idx]
  end
  
  def run
    while @players.length > 1
      play_round
      end_round
      continue?
      display_score
    end
    game_over
  end
  
  def play_round
    round_over = false
    until round_over
      take_turn(@current_player)
      round_over = !valid_play?(@fragment) || @challenged
      next_player!(@current_player, @previous_player)
    end

  end
  
  def take_turn(player)
    puts
    puts "Player: #{player.name}"
    puts "Current fragment: #{@fragment}"
    alpha = ("a".."z")
    guess = player.guess
    if guess == "challenge"
      challenge_player(@fragment)
      @challenged = true
    elsif alpha.include?(guess)
      @fragment = @fragment + guess
    else
      puts "Please enter only single A-Z characters or 'challenge' to challenge previous player."
      take_turn(player)
    end
  end
  
  
  def challenge_player(fragment)
    puts "*** #{@current_player.name} challenged #{@previous_player.name} ***"
    @dictionary.each do |word, v|
      if word[0...fragment.length] == fragment
        puts "There is a word: #{word}"
        @current_player.loses = 5
        return true
      end
    end
    puts "#{fragment} doesn't exist in dictionary"
    @previous_player.loses = 5
    return false
  end
  
  
  def valid_play?(fragment)
    if @dictionary.has_key?(fragment)
      puts
      puts "Round over, #{@current_player.name} spelled word #{fragment}"
      @current_player.loses += 1
      return false
    end
    true
  end

  def end_round
    calculate_losers
    @challenged = false
    @fragment = ""
  end
  
  def display_score
    puts "--------------------------"
    puts
    @players.each do |player|
      word = player.update_word
      puts "#{player.name} is a #{word}"
    end
    puts
    puts "--------------------------"
  end
  
  def continue?
    puts
    print "Press any key to continue the game."
    input = gets.chomp
  end
  
  def game_over
    puts 
    puts "***** Congratulations! *****"
    puts "#{@players[0].name} wins the game"
    puts
  end
  
  def calculate_losers
    @players.each do |player| 
      if player.loses == 5
        player.lost_game = true
        puts "*** #{player.name} loses the game ***"
        @players.delete(player)
      end
    end
    @players_num = @players.length
  end
  
end


game = Game.new

game.run
