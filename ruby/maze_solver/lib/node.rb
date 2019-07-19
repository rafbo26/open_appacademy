class Node
  
  attr_accessor :parent, :cost, :y, :x
  
  def initialize(parent, cost, y, x)
    @parent = parent
    @child = nil
    @cost = cost
    @y = y
    @x = x
  end

end