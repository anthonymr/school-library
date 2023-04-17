require_relative 'person'

class Teacher < Person
  def self.from_json(data)
    new(
      data['age'], data['specialization'],
      name: data['name'],
      parent_permission: data['parent_permission'],
      id: data['id']
    )
  end

  def initialize(age, specialization, name: 'Unknown', parent_permission: true, id: nil)
    super(age, name: name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    hash = super
    hash[:specialization] = @specialization
    hash[:type] = 'teacher'
    hash
  end
end
