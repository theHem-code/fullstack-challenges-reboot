# TODO: you can build your instacart program here!
store = {
  "kiwi" => 1.25,
  "banana" => 0.5,
  "mango" => 4,
  "asparagus" => 9
}

cart = []
count = []

# 1. Print Welcome
puts "------------------------------"
puts "Welcome to Peter's supermarket"

# 2. Define your store (what items are for sale?) Iterate over the hash of store
puts "We have the following items in our store:"

store.each do |key, value|
  puts "#{key}: #{value}€"
end

answer = nil

until answer == 'quit'
  puts "Which item? (or 'quit' to checkout)"
  answer = gets.chomp

  if store.key?(answer) == true
    cart << answer
    puts "You have #{cart.join(', ')} in your basket."
  else
    puts "Sorry, we don't have #{answer} today.."
  end

  puts "How many?"
  many = gets.chomp
  count << many
end

puts "-------BILL---------"

sum = 0
cart.each do |item|
  sum += store[item]
end
puts "You need to pay #{sum}€"
puts "--------------------"
# 3. Get items from the user (shopping)
# 4. Print the bill (checkout)
