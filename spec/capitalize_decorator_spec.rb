require_relative '../decorators/capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  context 'when the string is not empty' do
    it 'capitalizes the string' do
      person = Person.new(19, name: 'jhon')
      subject = CapitalizeDecorator.new(person)

      expect(subject.correct_name).to eq('Jhon')
    end
  end
end
