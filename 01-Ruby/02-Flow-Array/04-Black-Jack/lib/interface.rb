require_relative "croupier"

# Pick the bank score and store it in a variable
bank_score = pick_bank_score
# Initialize the player score at 0
player_score = 0
running = true

while running
  # Ask the player for a card
  puts "Card? 'y' to get a new card"
  # Get the player's answer and store it in a variable
  player_answer = gets.chomp
  # If the answer is 'y' or 'yes':
  if player_answer.include?('y')
    # Pick a player card and add it to the player score
    player_score += pick_player_card
    # Display the state of the game
    puts state_of_the_game(player_score, bank_score)
    running = player_score < 21
  else
    running = false
  end
  # Go back to ask the player for a card
end
# Print the end of the game message
puts end_game_message(player_score, bank_score)
