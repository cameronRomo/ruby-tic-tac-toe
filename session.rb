require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts "Welcome to tic tac toe."
    @players = [
      Player.new("Teven", :X),
      Player.new("Sasha", :O)
    ]
    play_a_game
  end

  def play_a_game
    p game = Game.new(@players)
    winner = game.play_until_win
    if winner
      puts "#{winner.name} won!!"
    else
      puts "The game was a tie!"
    end
    # puts "Wanna play again?"
  end
end
