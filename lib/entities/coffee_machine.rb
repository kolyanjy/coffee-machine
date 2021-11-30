class CoffeeMachine
  include Storage
  include Statistics

  attr_reader :milk, :coffee_beans, :water, :orders, :users

  def initialize
    @milk = Milk.new
    @coffee_beans = CoffeeBeans.new
    @water = Water.new
    @orders = []
    @users = []

    load_db
  end

  def add(entity)
    case entity
    when Milk then @milk.amount += entity.amount
    when CoffeeBeans then @coffee_beans.amount += entity.amount
    when Water then @water.amount += entity.amount
    when Order then @orders << entity
    when User then @users << entity
    else
      raise ClassError
    end
  end

  def make_cappuccino(user)
    drink = Cappuccino.new(water: @water, coffee_beans: @coffee_beans, milk: @milk)
    decrise_ammount(drink)
    add(Order.new(user, drink))
  end

  def make_espresso(user)
    drink = Espressoo.new(water: @water, coffee_beans: @coffee_beans)
    decrise_ammount(drink)
    add(Order.new(user, drink))
  end

  def make_americano(user)
    drink = Americano.new(water: @water, coffee_beans: @coffee_beans)
    decrise_ammount(drink)
    add(Order.new(user, drink))
  end

  private

  def decrise_ammount(drink)
    drink.class::RECIPE.each do |ingredient, value|
      case ingredient
      when :coffee_beans then @coffee_beans.amount -= value
      when :water then @water.amount -= value
      when :milk then @milk.amount -= value
      end
    end
  end

  def load_db
    load_data&.flatten&.each { |entity| add(entity) }
  end
end
