require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books(show_index: false)
    if show_index
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people(show_index: false)
    if show_index
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_rentals_for(person_id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end

  def create_person(name, age, type, parent_permission: false, specialization: '')
    if type == 'student'
      @people << Student.new(age, nil, name: name, parent_permission: parent_permission)

    elsif type == 'teacher'
      @people << Teacher.new(age, specialization, name: name)
    else
      puts 'Invalid type'
      return
    end

    puts 'Person created successfully'
  end

  def create_book(title, author)
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental(date, book_index, people_index)
    @rentals << Rental.new(date, @books[book_index], @people[people_index])
    puts 'Rental created successfully'
  end
end
