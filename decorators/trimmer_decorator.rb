require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length > 10
      super[0..9]
    end
  end
end
