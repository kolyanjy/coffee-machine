class Americano
  include Validator

  RECIPE = {
    coffee_beans: 1,
    water: 2
  }

  def initialize(water:, coffee_beans:)
    @coffee_beans = coffee_beans
    @water = water
    validate
  end

  private

  def validate
    check_class(@coffee_beans, CoffeeBeans)
    check_class(@water, Water)
    check_amount(@coffee_beans, RECIPE[:coffee_beans])
    check_amount(@water, RECIPE[:water])
  end
end