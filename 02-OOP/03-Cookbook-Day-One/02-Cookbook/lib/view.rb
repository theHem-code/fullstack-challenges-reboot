require_relative 'controller'
require_relative 'cookbook'
# View is just dealing with the user. No other task for him!

class View
  def ask_user_for(word)
    puts "What is the #{word} of your recipe?"
    print "> "
    return gets.chomp
  end

  def ask_for_index
    puts "What number you want to delete?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def display(recipes)
    # puts "YOUR RECIPES:"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. - #{recipe.name}"
    end
  end
end
