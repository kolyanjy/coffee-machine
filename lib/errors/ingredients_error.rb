class IngredientsError < StandardError
  def initialize(msg = 'Not enogth ingredient!')
    super
  end
end
