class Restaurant
  attr_reader :name

  def initialize(name, type, budget, open)
    @name = name
    @type = type
    @budget = budget
    @open = open
  end

  def open?
    @open
  end

  def change_open
    @open = !@open
  end
end
