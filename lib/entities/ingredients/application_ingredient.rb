class ApplicationIngredient
  include Validator

  attr_accessor :amount

  def initialize(amount = 0)
    check_class(amount, Integer)

    @amount = amount
  end
end
