class User
  include Validator

  def initialize(first_name:, last_name:, age:)
    @first_name = first_name
    @last_name = last_name
    @age = age
    validate
  end

  private

  def validate
    check_class(@first_name, String)
    check_class(@last_name, String)
    check_class(@age, Integer)
    check_empty(@first_name)
    check_empty(@last_name)
  end
end