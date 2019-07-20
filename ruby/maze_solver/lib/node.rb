class Node
  
  attr_accessor :parent, :cost, :y, :x
  
  def initialize(parent, target, y, x)
    @parent = parent
    @child = nil
    @cost = 10 # cost of one movement
    @G_cost = calc_G # cost of movement from the start to this node
    @H_cost = calc_H(target) # remaining cost of movements to get to the target
    @F_cost = calc_F # G + H
    @y = y
    @x = x
  end
  
  def calc_G
    @G_cost = 0
    @G_cost += self.cost
    if self.parent
      get_total_cost(self.parent)
    end
    return
  end
  
  def calc_H(target)
    y_dist = (target.y - @y).abs
    x_dist = (target.x - @x).abs
    y_dist + x_dist
  end
  
  def calc_F
    @G_cost + @H_cost
  end

end