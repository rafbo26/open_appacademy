class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    print "Enter next character: "
    character = gets.chomp
    
  end

end
