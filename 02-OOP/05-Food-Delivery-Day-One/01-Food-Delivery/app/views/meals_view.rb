# require_relative '../models/meal'
class MealsView
  def ask_for(stuff)
    puts "What is the #{stuff}?"
    print "> "
    return gets.chomp
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} | #{meal.price} | #{meal.id}"
    end
  end
end
