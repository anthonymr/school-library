require_relative 'app'

class UserInterface
  attr_accessor :app
  def initialize
    @app = App.new
    @selected_option = 0
  end

  def ask_user_for_option
    print_menu
    @selected_option = gets.chomp.to_i
  end

  def evaluate_option
    case @selected_option
    when 1
      option1
    when 2
      option2
    when 3
      option3
    when 4
      option4
    when 5
      option5
    when 6
      option6
    end
  end

  def exit_option?
    @selected_option == 7
  end

  def welcome_message
    puts 'Welcome to School Library App!'
  end

  def exit_message
    puts 'Thank you for using this app!'
  end

  def valid_option?
    @selected_option >= 1 && @selected_option <= 7
  end

  private

  def print_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
  end

  def option1()
    @app.list_books
  end

  def option2()
    @app.list_people
  end

  def option3()
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if type == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      @app.create_person(name, age, 'student', parent_permission: parent_permission)
    elsif type == 2
      print 'Specialization: '
      specialization = gets.chomp
      @app.create_person(name, age, 'teacher', specialization: specialization)
    else
      puts 'Invalid option'
    end
  end

  def option4()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def option5()
    print "Select a book from the following list by number\n"
    @app.list_books(show_index: true)
    book_index = gets.chomp.to_i

    print "Select a person from the following list by number (not id)\n"
    @app.list_people(show_index: true)
    people_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @app.create_rental(date, book_index, people_index)
  end

  def option6()
    print 'ID of person: '
    id = gets.chomp.to_i
    @app.list_rentals_for(id)
  end
end
