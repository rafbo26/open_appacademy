require "byebug"

class Solver
  
  def initialize
    @maze = get_maze
    @start = get_index(@maze, "S")
    @exit = get_index(@maze, "E")
    @position = get_index(@maze, "S")
    @completed_moves = []
  end
  
  def run
    make_move until @position == @exit
  end
  
  def make_move
    moves = find_moves(@position, @maze)
    move = select_move(moves)
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
  
  
  
  def select_move(moves)
    moves = moves.select { |move| !@completed_moves.include?(move) }
    scores = []
    moves.each do |move|
      distance = get_distance(move[0], @exit[0]) + get_distance(move[1], @exit[1])
      cost = 10 + distance
      scores << cost
    end
    moves[scores.index(scores.min)]
  end
  
  def get_distance(position, destination)
    (destination - position).abs
  end
  
  def find_moves(position, maze)
    y = position[0]
    x = position[1]
    direction = []
    direction << [y, x - 1] if maze[y][x - 1] != "*"
    direction << [y, x + 1] if maze[y][x + 1] != "*"
    direction << [y - 1, x] if maze[y - 1][x] != "*"
    direction << [y + 1, x] if maze[y + 1][x] != "*"
    direction
  end
  
  
  
  def get_maze
    File.readlines("maze.txt").map { |line| line.chomp }
  end
  
  def get_index(maze, value)
    maze.each.with_index do |line, row|
      if line.include?(value)
        col = line.index(value)
        return [row, col]
      end
    end
  end
  
end

solver = Solver.new
solver.run

