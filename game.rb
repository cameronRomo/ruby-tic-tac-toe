require_relative 'board'
require_relative 'player'

class Game
  def initialize players
    @players = players
    @board = Board.new
  end

  def play_until_win
    current_player, other_player = @players
    until @winner do
      play_turn(current_player)
      current_player, other_player = other_player, current_player
    end
    puts @board.display
    @winner
  end
  
  def play_turn(player)
    puts @board.display
    puts "It is #{player.name}'s turn."
    move = player.get_move
    @board[*move]=(player.marker)
    @winner = player if @board.winner? player
  end
end