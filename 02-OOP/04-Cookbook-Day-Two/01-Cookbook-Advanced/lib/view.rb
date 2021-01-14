require_relative 'controller'
require_relative 'cookbook'
require_relative 'recipe'

# View is just dealing with the user. No other task for him!

class View
  def ask_user_for(word)
    puts "What is the #{word} of your recipe?"
    print "> "
    return gets.chomp
  end

  def ask_for_index(command)
    puts "What number you want to #{command}?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      x = recipe.done? ? '[X]' : '[ ]'
      puts "#{index + 1}. #{x} #{recipe.name} | Rating: #{recipe.rating} | Preparation Time: #{recipe.prep_time}"
    end
  end

  def ask_user_for_search
    puts "What ingredient would you like a recipe for?"
    keyword = gets.chomp
    puts "Looking for #{keyword} recipes on the Internet..."
    return keyword
  end

  def display_websearch(element)
    element.each_with_index do |item, index|
      puts "#{index + 1}. - #{item.name} | Rating: #{item.rating} | Preparation Time: #{item.prep_time}"
    end
  end
end
