class Cappuccino
  include Validator

  RECIPE = {
    coffee_beans: 1,
    water: 1,
    milk: 2
  }.freeze

  def initialize(water:, coffee_beans:, milk:)
    @milk = milk
    @coffee_beans = coffee_beans
    @water = water
    validate
  end

  private

  def validate
    check_class(@water, Water)
    check_class(@coffee_beans, CoffeeBeans)
    check_class(@milk, Milk)
    check_amount(@milk, RECIPE[:milk])
    check_amount(@water, RECIPE[:water])
    check_amount(@coffee_beans, RECIPE[:coffee_beans])
  end
end
