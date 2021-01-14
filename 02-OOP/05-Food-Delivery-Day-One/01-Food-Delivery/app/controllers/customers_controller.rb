require_relative '../models/customer'
require_relative '../views/customers_view'
require_relative '../repositories/customer_repository'


class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # ask the user for the name
    name = @customers_view.ask_for('name')
    # ask user for the address
    address = @customers_view.ask_for('adress')
    # store in variables
    # create an custmer intance
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.create(new_customer)
    # display the customers
    display_customers
  end

  def list
    display_customers
  end


  private

  def display_customers
    customers = @customer_repository.all
    @customers_view.display(customers)
  end
end
