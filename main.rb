require_relative 'person'
require_relative 'decorators/trimmer_decorator'
require_relative 'decorators/capitalize_decorator'

person = Person.new(22, name: 'maximilianus ')
p person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name