require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'when initialized' do
    classroom = Classroom.new('101')
    it 'has a label' do
      expect(classroom.label).to eq('101')
    end

    it 'has no students' do
      expect(classroom.students).to be_empty
    end
  end

  context 'when adding students' do
    classroom = Classroom.new('101')
    student = Student.new('John', 'Doe')
    classroom.add_student(student)
    it 'has students' do
      expect(classroom.students).not_to be_empty
    end

    it 'has the correct student' do
      expect(classroom.students[0]).to eq(student)
    end
  end
end
