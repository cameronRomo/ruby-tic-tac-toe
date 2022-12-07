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

  def row_win? marker
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win? marker
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diaganal_win?

  end
end

def print_and_check
  @b.print_grid
  puts "Row with all Os?: #{@b.row_win? :O}"
  puts "Row with all Xs?: #{@b.row_win? :X}"
  puts "Column with all Os?: #{@b.column_win? :O}"
  puts "Column with all Xs?: #{@b.column_win? :X}"
end

@b = Board.new
print_and_check
@b.grid[0][2] = :O
print_and_check
@b.grid[1][2] = :O
print_and_check
@b.grid[2][2] = :O
print_and_check
