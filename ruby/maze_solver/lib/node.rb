class Node
  
  attr_accessor :parent, :cost, :y, :x, :G_cost, :F_cost, :H_cost
  
  def initialize(parent, y, x)
    @parent = parent
    @child = nil
    @cost = 10 # cost of one movement
    @G_cost = 0 # cost of movement from the start to this node
    @H_cost = 0 # remaining cost of movements to get to the target
    @F_cost = 0 # G + H
    @y = y
    @x = x
  end
  
  def calc_all(target)
    @G_cost = 0
    calc_G(self)
    calc_H(target)
    calc_F
  end

  def calc_G(node)
    @G_cost += node.cost
    if node.parent
      calc_G(node.parent)
    end
    return
  end
  
  def calc_H(target)
    y_dist = (target.y - @y).abs
    x_dist = (target.x - @x).abs
    @H_cost = y_dist + x_dist
  end
  
  def calc_F
    @F_cost = @G_cost + @H_cost
  end

end