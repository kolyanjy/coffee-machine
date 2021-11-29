module Storage
  FILE_PATH = 'data/data.yml'.freeze

  def load_data
    create_storage unless storage_exist? 

    list = [User, CoffeeBeans, Water, Milk, Time, Order, Cappuccino, Americano, Espresso]
    YAML.safe_load(File.read(FILE_PATH), list, [], [], true)
  end

  def save_data(milk:, coffee_beans:, water:, orders:, users:)
    storage = [milk, coffee_beans, water, orders, users]

    File.open(FILE_PATH, 'w') { |file| file.write storage.to_yaml }
  end

  private

  def storage_exist?
    File.exist? FILE_PATH
  end

  def create_storage
    File.new(FILE_PATH, 'w+')
  end
end