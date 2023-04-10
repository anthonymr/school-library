require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name unless @nameable.correct_name.length > 10

    super[0..9]
  end
end
