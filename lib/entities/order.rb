class Order
  include Validator

  attr_reader :user, :drink, :date

  def initialize(user, drink, date = Time.now)
    @user = user
    @drink = drink
    @date = date
    validate
  end

  def validate
    check_class(@user, ::User)
    check_class(@date, ::Time)
    check_class(@drink, ::Americano, ::Cappuccino, ::Espresso)
  end
end