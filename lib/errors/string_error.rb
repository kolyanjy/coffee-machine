class StringError < StandardError
  def initialize(msg = 'String must be not empty!')
    super
  end
end
