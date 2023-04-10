require_relative 'decorators/decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super.strip
  end
end
