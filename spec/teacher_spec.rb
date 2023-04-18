require_relative '../teacher'

describe Teacher do
  it 'teacher should initalize successfully' do
    teacher = Teacher.new(30, 'Math', name: 'John', parent_permission: true, id: 1)
    expect(teacher).to be_a(Teacher)
  end

  it '[from_json] should return a teacher object' do
    teacher = Teacher.from_json('{"id":1,"name":"John","age":30,"parent_permission":true,"specialization":"Math"}')
    expect(teacher).to be_a(Teacher)
  end

  teacher = nil

  before :each do
    teacher = Teacher.new(30, 'Math', name: 'John', parent_permission: true, id: 1)
  end

  it '[can_use_services?] should return true' do
    expect(teacher.can_use_services?).to be(true)
  end

  context 'to_hash' do
    it 'should return a hash' do
      teacher_hash = teacher.to_hash

      expect(teacher_hash).to be_a(Hash)
    end

    it 'should return a hash with the correct keys' do
      teacher_hash = teacher.to_hash

      expect(teacher_hash.keys).to match_array(%i[id name age parent_permission specialization type])
    end
  end
end
