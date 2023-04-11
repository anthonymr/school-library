require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'

math_classroom = Classroom.new('Mathematics')

person = Person.new(18, name: 'person1')
student1 = Student.new(30, math_classroom, name: 'student1')
student2 = Student.new(45, math_classroom, name: 'student2')
teacher = Teacher.new(55, nil, name: 'teacher1')

book1 = Book.new('Book1 title', 'Book1 author')
book2 = Book.new('Book2 title', 'Book2 author')

# person has rented book1 and book2
rental1 = Rental.new('2021-01-01', book1, person)
rental2 = Rental.new('2021-01-01', book2, person)
# student1 has rented book1
rental3 = Rental.new('2021-01-01', book1, student1)
# techer1 has rented book2
rental4 = Rental.new('2021-01-01', book2, teacher)

# Adding studets to math_classroom
math_classroom.add_student(student1)
math_classroom.add_student(student2)

print 'Who has rented book1?: '
puts book1.rentals.map { |rental| rental.person.name }.join(', ')

print 'Who has rented book2?: '
puts book2.rentals.map { |rental| rental.person.name }.join(', ')

print 'Person rentals: '
puts person.rentals.map { |rental| rental.book.title }.join(', ')

print 'Student1 rentals: '
puts student1.rentals.map { |rental| rental.book.title }.join(', ')

print 'Teacher1 rentals: '
puts teacher.rentals.map { |rental| rental.book.title }.join(', ')

print 'Students in math_classroom: '
puts math_classroom.students.map(&:name).join(', ')

print 'Student1 classroom: '
puts student1.classroom.label

print 'Student2 classroom: '
puts student2.classroom.label

print 'Details of rental1: '
puts "Book: #{rental1.book.title}, Person: #{rental1.person.name}"

print 'Details of rental2: '
puts "Book: #{rental2.book.title}, Person: #{rental2.person.name}"

print 'Details of rental3: '
puts "Book: #{rental3.book.title}, Person: #{rental3.person.name}"

print 'Details of rental4: '
puts "Book: #{rental4.book.title}, Person: #{rental4.person.name}"
