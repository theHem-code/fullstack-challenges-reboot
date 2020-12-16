require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

answer = nil

until answer == ""
  puts "What do u want to know from your coach?"
  your_message = gets.chomp
  answer = coach_answer_enhanced(your_message)
  puts answer
end
