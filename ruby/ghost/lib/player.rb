class Player

  attr_accessor :name, :loses, :lost_game
  attr_reader :word

  def initialize(name)
    @name = name
    @loses = 0
    @word = ""
    @lost_game = false
  end

  def guess
    print "Enter next character: "
    character = gets.chomp.downcase
  end
  
  def update_word
    @word = "GHOST"[0...@loses]
  end

end
