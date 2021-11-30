module Validator
  def check_empty(string)
    raise StringError if string.empty?
  end

  def check_class(entity, *klasses)
    raise ClassError unless klasses.any? { |klass| entity.is_a? klass }
  end

  def check_amount(ingredient, value)
    raise IngredientsError if ingredient.amount < value
  end
end
