require_relative '../decorators/decorator'
require_relative '../person'

describe Decorator do
  context 'when the string is not empty' do
    it 'Should return the same name' do
      person = Person.new(19, name: 'jhon')
      subject = Decorator.new(person)

      expect(subject.correct_name).to eq('jhon')
    end
  end
end
