require_relative 'person'

class Student < Person
  attr_reader :classroom

  def self.from_json(data)
    new(
      data['age'], data['classroom'],
      name: data['name'],
      parent_permission: data['parent_permission'],
      id: data['id']
    )
  end

  def initialize(age, classroom, name: 'Unknown', parent_permission: true, id: nil)
    super(age, name: name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def to_hash
    hash = super
    hash[:classroom] = @classroom
    hash[:type] = 'student'
    hash
  end
end
