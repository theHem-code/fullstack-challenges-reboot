require_relative '../views/meals_view'
require_relative '../models/meal'
require_relative '../repositories/meal_repository'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    name = @meals_view.ask_for('name')
    price = @meals_view.ask_for('price').to_i
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end

  def list
    meals = @meal_repository.all
    @meals_view.display(meals)
  end
end
