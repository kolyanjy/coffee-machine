class Espresso
  include Validator

  RECIPE = {
    coffee_beans: 2,
    water: 1
  }

  def initialize(water:, coffee_beans:)
    @coffee_beans = coffee_beans
    @water = water
    validate
  end

  private

  def validate
    check_class(@water, Water)
    check_class(@coffee_beans, CoffeeBeans)
    check_amount(@water, RECIPE[:water])
    check_amount(@coffee_beans, RECIPE[:coffee_beans])
  end
end