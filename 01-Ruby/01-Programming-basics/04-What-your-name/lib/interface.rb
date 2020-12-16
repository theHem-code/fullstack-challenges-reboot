require_relative "compute_name"

def ask_and_get(name)
  puts "What is your #{name}"
  gets.chomp
end

def name_from_terminal
  first_name = ask_and_get("first name")
  middle_name = ask_and_get("middle name")
  last_name = ask_and_get("last name")
  compute_name(first_name, middle_name, last_name)
end

puts "Hello #{name_from_terminal}"
