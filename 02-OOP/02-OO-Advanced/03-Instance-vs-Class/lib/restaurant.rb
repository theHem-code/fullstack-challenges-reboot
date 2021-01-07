class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @number_of_ratings = 0
    @sum_of_ratings = 0
    @average_rating = 0
  end

  def rate(new_rate)
    @number_of_ratings += 1
    @sum_of_ratings += new_rate
    @average_rating = @sum_of_ratings.to_f / @number_of_ratings
  end

  # TODO: implement .filter_by_city and #rate methods
  def self.filter_by_city(restaurants, city)
    restaurants.select do |restaurant|
      restaurant.city == city
    end
  end
end
