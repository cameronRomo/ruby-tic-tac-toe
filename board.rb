class Board
  WIDTH = 3
  HEIGHT = WIDTH

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end
  
  def winner? player
    row_win?(player.marker) || column_win?(player.marker) || diagonal_win?(player.marker)
  end

  def spaces_left?
    @grid.any? do |row|
      row.any? do |cell|
        cell == :" "
      end
    end
  end
  
  def place_marker(coordinates, marker)
    y, x = coordinates
    @grid[y][x] == :" " && @grid[y][x] = marker
  end
  
  def display
    output = "\n"
    output << generate_header
    output << genereate_rows
  end
  
  private
  def format_row row, letter
    row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]" } << "\n"
  end
  
  def genereate_rows
    letter = "@"

    @grid.reduce("") do |output, row| 
      letter = letter.next
      output << format_row(row, letter)
    end
  end

  def generate_header
    (1..WIDTH).reduce("   ") { |header, row_number| header << "  #{row_number}" } << "\n"
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

  def diagonal_win? marker
    [-1, 1].any? do |sign|
      (0...WIDTH).all? do |i|
        second_index = sign > 0 ? i : sign * (i + 1)
        @grid[i][second_index] == marker
      end
    end
  end
end
