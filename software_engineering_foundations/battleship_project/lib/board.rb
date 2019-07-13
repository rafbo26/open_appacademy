class Board
  
  attr_reader :size
  
  def initialize(size)
    @grid = Array.new(size) { Array.new(size, :N) }
    @size = size * size
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end
  
  def num_ships
    count = 0
    @grid.each { |row| count += row.count(:S) }
    count
  end
  
  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end
  
  def place_random_ships
    ships_num = @size / 4
    ships = []
    while ships.length < ships_num
      x = rand(0...@grid.length)
      y = rand(0...@grid.length)
      if !ships.include?([x, y])
        ships << [x, y]
        self[[x, y]] = :S
      end
    end
  end
  
  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          ele = :N
        else
          ele
        end
      end
    end
  end
  
  def self.print_grid(grid)
    grid.each { |row| puts row.join(" ") }
  end
  
  def cheat
    Board.print_grid(@grid)
  end
  
  def print
    Board.print_grid(hidden_ships_grid)
  end
  
end
