require_relative 'person'
require_relative 'decorators/trimmer_decorator'
require_relative 'decorators/capitalize_decorator'

person = Person.new(22, name: 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
