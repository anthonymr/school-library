require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true, id: nil)
    super()
    @id = id || rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission || false
    @rentals = []
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

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  def to_hash
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end

  private :of_age?
end
