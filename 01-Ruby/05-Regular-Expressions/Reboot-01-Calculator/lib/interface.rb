# TODO: you can build your calculator program here!
# Welcome the user
# Prompt the user for input
# store the input in a variable
# Ask the user which operator
answer = "y"

def calculate(num1, num2, operator)
  case operator
  when "+" then result = num1 + num2
  when "-" then result = num1 - num2
  when "*" then result = num1 * num2
  when "/" then result = num1.to_f / num2
  else
    return nil
  end
end

until answer == "n"

puts "Welcome to your personal calculator"

puts "Enter a first number:"
first_num = gets.chomp.to_i

puts "Enter a second one:"
second_num = gets.chomp.to_i

puts "Choose operation [+][-][*][/]"
operator = gets.chomp

result = calculate(first_num, second_num, operator)

if result.nil?
  puts "Wrong input"
else
  puts "Result: #{result}"
end

puts "Do you wan to calculate again? [y / n ]"
answer = gets.chomp

end




 # if operator == "+"
 #    result = num1 + num2
 #  elsif operator == "-"
 #    result = num1 - num2
 #  elsif operator == "*"
 #    result = num1 * num2
 #  elsif operator == "/"
 #    result = num1 / num2
 #  else
 #    "invalid"
 #  end

