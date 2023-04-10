require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission || false
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  private :of_age?
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    super.strip
  end
end
