class Game

  attr_reader :name
  attr_writer :name

  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end

  def start 
    puts "Welcome to Ruby Math Game. Please input names for Player 1 and Player 2."
    puts "Please enter name for Player 1: "
    puts "> "
    @player1.name = $stdin.gets.chomp
    puts "Welcome #{@player1.name}."
    puts "Please enter name for Player 2: "
    puts "> "
    @player2.name = $stdin.gets.chomp
    puts "Welcome #{@player2.name}."
    puts "Now beginning...Please get ready #{@player1.name} and #{@player2.name}."
    turn
  end 

  def checkScore
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    end
  end 

  def currentScore
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def subtractScore(player)
    player.lives -= 1
  end


  def turn
    puts "----- NEW TURN -----"
    currentScore
    question = Question.new()
    question.question(@player1.name)
    answer = $stdin.gets.chomp.to_i
    if !question.isCorrect?(answer)
      subtractScore(@player1)
      puts "#{@player1.name}, Seriously? No!"
    else 
      puts "Congrats #{@player1.name}. You are correct!"
    end
    checkScore
    currentScore
    puts "----- NEW TURN -----"
    question = Question.new()
    question.question(@player2.name)
    answer = $stdin.gets.chomp.to_i
    if !question.isCorrect?(answer)
      subtractScore(@player2)
      puts "#{@player2.name}, Seriously? No!"
    else 
      puts "Congrats #{@player2.name}. You are correct!"
    end
    checkScore
    currentScore
    turn
  end 
  
end