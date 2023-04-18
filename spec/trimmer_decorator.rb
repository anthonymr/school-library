require_relative '../decorators/trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'when the string is not empty' do
    it 'trimm the string if length more than 10 characters' do
      person = Person.new(19, name: 'Averylongname')
      subject = TrimmerDecorator.new(person)

      expect(subject.correct_name).to eq('Averylongn')
    end
  end
end
