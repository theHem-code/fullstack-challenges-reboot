class CustomersView
  def ask_for(stuff)
    puts "What is the #{stuff}?"
    print "> "
    return gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}"
    end
  end
end
