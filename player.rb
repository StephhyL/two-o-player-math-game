class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def answers_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{self.name}: What does #{num1} plus #{num2} equal?"
    print '> '
    actual_answer = gets.chomp.to_i
    expected_answer = num1 + num2

    puts(
      if actual_answer === expected_answer
        'YES! You are correct'
      else
        self.lives -= 1
        'Seriously? No!'
      end,
    )
  end

  def lives_left
    "#{self.lives}/3"
  end

  def loser?
    self.lives === 0
  end
end
