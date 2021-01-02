require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  letters = ('A'..'Z').to_a
  grid_size.times.map {letters.sample}
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  big_result = []

  url = "https://wagon-dictionary.herokuapp.com/#{attempt.downcase}"
  word_serialized = open(url).read
  word = JSON.parse(word_serialized)

  if word["found"] == true
    big_result << { time: end_time - start_time, message: "Well done", score: (end_time - start_time) + attempt.length }
  else
    puts "Word is invalid. Sorry, you have got no points"
  end

  result = big_result[0]
end

