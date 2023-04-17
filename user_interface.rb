require_relative 'app'

class UserInterface
  def initialize
    @app = App.new
    @selected_option = 0
  end

  def ask_user_for_option
    print_menu
    @selected_option = gets.chomp.to_i
  end

  def evaluate_option
  end

  def exit_option?
    return @selected_option == 7
  end

  def welcome_message
    puts 'Welcome to School Library App!'
  end

  def exit_message
    puts 'Thank you for using this app!'
  end

  def valid_option?
    return @selected_option >= 1 && @selected_option <= 7
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
end