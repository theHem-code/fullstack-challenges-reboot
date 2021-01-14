require_relative 'view'
require_relative 'recipe'
require_relative 'cookbook'
require 'open-uri'
require 'nokogiri'


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
    recipe_rating = @view.ask_user_for('rating')
    recipe_prep_time = @view.ask_user_for('preperation time')
    # Create the recipe
    new_recipe = Recipe.new(recipe_name, recipe_desc, recipe_rating, recipe_prep_time)
    # Give the recipe to the cookbook
    @cookbook.add_recipe(new_recipe) # I need to add a *Recipe* instance
  end

  def import
    # TODO
    # Ask a user for a keyword to search
    keyword = @view.ask_user_for_search
    url = "https://www.allrecipes.com/search/?wt=#{keyword}"
    html_file = open(url).read
    # Parsing/analysing the html file with Nokogiri gem
    html_doc = Nokogiri::HTML(html_file)
    web_search = []
    html_doc.search('.fixed-recipe-card').first(5).each do |element|
      # .search with the CSS class, gimme the first
      # convert html to text with .text
      # delete space between the text with .strip
      name = element.search(".fixed-recipe-card__title-link").first.text.strip
      description = element.search(".fixed-recipe-card__description").first.text.strip
      # With .attribute we get to a specific attribute from the CSS class and get access to it with .value
      rating = element.search(".stars.stars-4-5").attribute("data-ratingstars").value.to_f.round(2)
      # author = element.search(".cook-submitter-info h4").text.strip.split("By ")[1]
      # the author is in an upper class and the [1] gives me the second element of the array
      recipe_url = element.search(".fixed-recipe-card__title-link").attribute('href').value
      recipe_html = open(recipe_url).read
      recipe_doc = Nokogiri::HTML(recipe_html)
      prep_time = recipe_doc.search(".recipe-meta-item-body").first.text.strip
      web_search << Recipe.new(name, description, rating, prep_time)
    end
    @view.display_websearch(web_search)
    index = @view.ask_for_index('add')
    add_recipe = web_search[index]
    @cookbook.add_recipe(add_recipe)
    display_recipes
  end

  def mark_as_done
    # TODO
    display_recipes
    recipe_index = @view.ask_for_index('mark')
    @cookbook.mark_recipe(recipe_index)
    display_recipes
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_for_index('delete')
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
