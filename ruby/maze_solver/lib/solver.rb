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
    moves = find_moves(@position, @maze)
    select_move(@position)
    move = @choice
    @completed_moves << move
    @maze[move[0]][move[1]] = "X"
    @position = move
    #debugger
    print_maze
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
    nodes << Node.new(parent, get_distance(y, x - 1), y, x - 1) if @maze[y][x - 1] != "*"
    nodes << Node.new(parent, get_distancey, x + 1), y, x + 1) if @maze[y][x - 1] != "*"
    nodes << Node.new(parent, get_distance(y - 1, x), y - 1, x) if @maze[y][x - 1] != "*"
    nodes << Node.new(parent, get_distance(y + 1, x), y + 1, x) if @maze[y][x - 1] != "*"
    nodes.select { |node| !@closed_nodes.include?(node) }
  end
  
  
  def get_distance(y, x)
    y_dist = (@exit[0] - y).abs
    x_dist = (@exit[1] - x).abs
    x + y
  end
  
  
  def get_maze
    File.readlines("maze.txt").map { |line| line.chomp }
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

