require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  "Your score is #{player_score}, bank is #{bank_score}."
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > 21
    "You are over 21. You lose"
  elsif player_score == 21
    "Black Jack!"
  elsif player_score > bank_score
    "You won"
  elsif player_score < bank_score
    "You lose"
  else
    "It's a push"
  end
end
