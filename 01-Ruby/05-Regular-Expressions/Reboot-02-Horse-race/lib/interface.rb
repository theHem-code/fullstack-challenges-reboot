# TODO: you can build your horse race program here!
# Welcome the user
# Present the user the horses (names) in order of numbers
# prompt the user to choose a horse
# stre the input in a variable
# let the computer chose the winner (random)
# if the winne rhorse is the choice of the user tellthe user he won if not he lost.
# aks him if he want to play agian
horses = ["Black Beauty", "Spirit", "Fury", "Dumbo"]
answer = "y"
balance = 100

while answer == "y"

puts "Welcome to the horse race. Here are our horses for today:"

horses.each_with_index do |horse, index|
  puts "#{index + 1}. #{horse}"
end

puts "Pick a number."
choice = gets.chomp.to_i - 1
user = horses[choice]

winner = horses.sample


if user == winner
  balance += 50
  puts "You won. #{user} was first. Your balance is now #{balance}."
else
  balance -= 10
  puts "You loose. #{winner} was first. Your balance is now #{balance}."
end

if balance > 10
  puts "Do you wanna play again? [y / n]"
  answer = gets.chomp
else
  puts "You need to leave. No money left."
  answer = "n"
end

end
