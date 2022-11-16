class Question 

 def initialize
  @num1 = rand(1..20)
  @num2 = rand(1..20)
  @answer = @num1 + @num2
 end

 def question(playerName)
  puts "#{playerName}: What does #{@num1} plus #{@num2} equal?"
 end

 def isCorrect?(answer)
  return @answer == answer
 end 

end