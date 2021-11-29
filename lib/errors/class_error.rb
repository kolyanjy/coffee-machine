class ClassError < StandardError
  def initialize(msg = 'Wrong class!')
    super
  end
end