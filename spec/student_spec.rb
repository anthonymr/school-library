require_relative '../student'
require_relative '../classroom'

describe Student do
  it 'student should initalize successfully' do
    student = Student.new(18, nil, name: 'John Doe')
    expect(student.age).to eq(18)
    expect(student.name).to eq('John Doe')
  end

  it '[from_json] method should return a student object' do
    data = {
      'id' => 1,
      'name' => 'John Doe',
      'age' => 18,
      'parent_permission' => true
    }
    student = Student.from_json(data)

    expect(student.name).to eq('John Doe')
    expect(student.age).to eq(18)
  end

  student = nil

  before :each do
    student = Student.new(18, nil, name: 'John Doe')
  end

  it '[play_hooky] method should return a string' do
    expect(student.play_hooky).to be_a(String)
  end

  it '[classroom] setter should add student to classroom' do
    classroom = Classroom.new('Math')

    student.classroom = classroom

    expect(classroom.students).to include(student)
  end

  context 'to_hash' do
    it 'should return the hash' do
      expect(student.to_hash).to be_a(Hash)
    end

    it 'should return the correct value' do
      hash = student.to_hash

      expect(hash[:age]).to eq(student.age)
      expect(hash[:name]).to eq(student.name)
    end
  end
end
