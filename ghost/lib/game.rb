class Game

  def initialize
    @dictionary = populate_dictionary
  end

  def populate_dictionary
    arr = []
    arr = File.readlines("dictionary.txt")
    arr
  end

end