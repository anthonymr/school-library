require_relative 'decorators/decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
