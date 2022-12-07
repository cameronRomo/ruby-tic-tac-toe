require_relative 'game'
require_relative 'player'

puts players = [
  Player.new("Teven", :X),
  Player.new("Sasha", :O)
]

p game = Game.new(players)