require_relative '../autoload'
machine = CoffeeMachine.new

machine.add(Milk.new(10))
machine.add(Water.new(10))
machine.add(CoffeeBeans.new(10))
user1 = User.new(first_name: 'Bob', last_name: 'Job', age: 10)
user2 = User.new(first_name: 'Nick', last_name: 'Check', age: 22)
machine.add(user1)
machine.add(user2)
machine.make_cappuccino(user1)
machine.make_americano(user1)
machine.make_americano(user1)
machine.make_americano(user2)

machine.save_data(
  milk: machine.milk,
  coffee_beans: machine.coffee_beans,
  water: machine.water,
  orders: machine.orders,
  users: machine.users
)
