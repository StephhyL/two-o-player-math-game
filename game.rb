require_relative './player'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')

    #shuffles the player list so that it's not always player 1 that starts (to make it more fair)
    @players = [@player1, @player2].shuffle
  end

  #since current_player is the first element in the players array and measuring the loser, the winner is the last element in the array
  def getWinner
    @players.last
  end

  def game_over
    #"filter" for the players array. If the player is a loser (@lives_left = 0), then it would be added to the array and when there is a loser, the game is over
    @players.select { |player| player.loser? }.count > 0
  end

  def goodbye_message
    puts '--------------------'
    puts "#{getWinner.name} wins wih a score of #{getWinner.lives_left}"
    puts '---- GAME OVER -----'
    puts 'Good bye!'
  end

  def play
    # intro
    puts 'Welcome to Two-O-Player Math Game!'

    until game_over
      @current_player = @players.first

      # player question after each round
      @current_player.answers_question

      # score display after each round
      puts "P1: #{@player1.lives_left} vs P2: #{@player2.lives_left}"

      if @current_player.lives > 0
        puts '----- NEW TURN -----'

        #use the ! to mutate the original array
        @players.rotate!
      else
        goodbye_message
      end
    end
  end
end
