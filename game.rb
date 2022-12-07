require_relative 'board'

class Game
  def initialize players
    @players = players
    @board = Board.new
  end
end