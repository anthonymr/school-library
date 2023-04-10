require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    super.strip
  end
end
