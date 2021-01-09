# Cookbook, the repository, i just dealing with the storage (Database)
require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    # TODO
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    # TODO
    return @recipes
  end

  def add_recipe(recipe)
    # TODO
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end


  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
