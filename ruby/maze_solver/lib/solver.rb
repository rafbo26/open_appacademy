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
  end
  
  def run
    @open_nodes << @start
    make_move
  end
  
  def make_move
    10.times { path_finder }
    @open_nodes.each do |n|
      print n.x
      print " "
      print n.y
      puts
    end
  end
  
  def print_maze
    @maze.each do |line|
      puts line
    end
  end
  
  def path_finder
    # Find lowest cost node on the open list
    next_node = @open_nodes.min { |node| node.F_cost }
    mark_map(next_node)
    # Move it to the closed list
    @closed_nodes << next_node
    @open_nodes.delete(next_node)
    # Find all moves for that node (ignore closed and unmovable)
    adjacent_nodes = find_nodes(next_node)
    adjacent_nodes.each do |adj_node|
      if @open_nodes.include?(adj_node)
        #check if G score is lower
        new_node = adj_node.clone
        new_node.parent = next_node
        new_node.calc_all(@exit)
        puts new_node.G_cost < adj_node.G_cost
      else
        @open_nodes << adj_node
      end
    end
  end
  
  def mark_map(node)
    @maze[node.y][node.x] = "X"
    print_maze
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
    node = Node.new(parent, y, x)
    node.calc_all(@exit)
    nodes << node
  end
  
  def get_maze
    File.readlines("./maze.txt").map { |line| line.chomp }
  end
  
  def get_index(maze, value)
    maze.each.with_index do |line, y|
      if line.include?(value)
        x = line.index(value)
        return Node.new(nil, y, x)
      end
    end
  end
  
end

solver = Solver.new
solver.run

