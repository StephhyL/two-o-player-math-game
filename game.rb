require_relative './player'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
  end

  def game_over
    #"filter" for the players array. If the player is a loser (@lives_left = 0), then it would be added to the array and when there is a loser, the game is over
    @players.select { |player| player.loser? }.count > 0
  end

  def goodbye_message
    puts '---- GAME OVER -----'
    puts 'Good bye!'
  end

  def play
    # intro
    puts 'Welcome to Two-O-Player Math Game!'

    until game_over
      puts lives = @player1.lives

      # player question after each round
      @player1.answers_question

      # score display after each round
      puts "P1: #{@player1.lives_left} vs P2: #{@player2.lives_left}"

      puts '----- NEW TURN ----'
    end

    #closing remarks
    goodbye_message
  end

  def info
    p @player1
    p @player2
  end
end
