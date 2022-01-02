require_relative './player'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end

  def play
    puts "#{@player1}: What does 5 plus 3 equal?"
    print '> '
    answer = gets.chomp.to_i

    puts answer === 8 ? 'YES! You are correct' : 'Seriously? No!'

    # puts "> #{gets.chomp}"
    puts '----- NEW TURN ----'
  end

  def info
    p @player1
    p @player2
  end
end
