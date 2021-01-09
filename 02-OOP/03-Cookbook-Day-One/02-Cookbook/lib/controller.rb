require_relative 'view'
require_relative 'recipe'
require_relative 'cookbook'


class Controller
  # User Action
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # (the controller needs to coordinate the user action)
    # Ask the user what he wants to add
    recipe_name = @view.ask_user_for('name')
    recipe_desc = @view.ask_user_for('description')
    # Create the recipe
    new_recipe = Recipe.new(recipe_name, recipe_desc)
    # Give the recipe to the cookbook
    @cookbook.add_recipe(new_recipe) # I need to add a *Recipe* instance
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_for_index
    @cookbook.remove_recipe(recipe_index)
    display_recipes
  end

  private

  def display_recipes
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
