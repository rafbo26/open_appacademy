class Player

  def get_move
    print "enter a position with coordinates separated with a space like `4 7` "
    coords = gets.chomp.split(" ")
    coords.map { |ele| ele.to_i }
  end
end
