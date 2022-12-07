class Board
  WIDTH = 3
  HEIGHT = WIDTH

  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

  def row_win
    @grid.any? do |row|
      row.all? do |cell|
        cell == :X
      end
    end
  end

  def column_win

  end

  def diaganal_win

  end
end

def print_and_check
  @b.print_grid
  p @b.row_win  
end

@b = Board.new
print_and_check
@b.grid[0][0] = :X
print_and_check
@b.grid[0][1] = :X
print_and_check
@b.grid[0][2] = :X
print_and_check