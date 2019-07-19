require "byebug"
require_relative "node"

class Solver
  
  def initialize
    @maze = get_maze
    @start = get_index(@maze, "S")
    @exit = get_index(@maze, "E")
    @position = get_index(@maze, "S")
    @open_nodes = []
    @closed_nodes = []
    @total_cost
  end
  
  def run
    @open_nodes << @start
    make_move until @position == @exit
  end
  
  def make_move
    p path_finder(@start)
    sleep(1)
  end
  
  def print_maze
    @maze.each do |line|
      puts line
    end
  end
  
  
  
  def path_finder(node)
    # Find lowest cost node on the open list
    next_node = @open_nodes.min { |node| node.cost }
    # Move it to the closed list
    @closed_nodes << next_node
    # Find all moves for that node (ignore closed and unmovable)
    children = find_nodes(next_node)
    
  end
  

  
  def find_nodes(parent)
    y = parent.y
    x = parent.x
    nodes = []
    add_node(parent, nodes, y, x - 1) if @maze[y][x - 1] != "*"
    add_node(parent, nodes, y, x + 1) if @maze[y][x + 1] != "*"
    add_node(parent, nodes, y - 1, x) if @maze[y - 1][x] != "*"
    add_node(parent, nodes, y + 1, x) if @maze[y + 1][x] != "*"
    nodes
  end
  
  def add_node(parent, nodes, y, x)
    cost = get_cost(y, x)
    nodes << Node.new(parent, cost, y, x)
  end

  def get_cost(y, x)
    y_dist = (@exit.y - y).abs
    x_dist = (@exit.x - x).abs
    y_dist + x_dist
  end
  
  
  def get_maze
    File.readlines("./maze.txt").map { |line| line.chomp }
  end
  
  def get_index(maze, value)
    maze.each.with_index do |line, y|
      if line.include?(value)
        x = line.index(value)
        return Node.new(nil, 0, y, x)
      end
    end
  end
  
end

solver = Solver.new
solver.run

