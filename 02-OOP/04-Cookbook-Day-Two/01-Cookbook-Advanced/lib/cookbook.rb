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

  def mark_recipe(recipe_index)
    recipe = @recipes[recipe_index]
    recipe.mark_as_done!
    recipe.done?
    save_to_csv
  end


  private

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["name", "description", "rating", "prep_time", "done?"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end
end
