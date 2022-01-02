require_relative './player'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end

  def play
    puts '----- NEW TURN ----'
  end

  def info
    p @player1
    p @player2
  end
end
