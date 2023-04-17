require_relative 'user_interface'
require_relative 'local_storage'

def main
  LocalStorage.book_file = 'local_storage/books.json'
  LocalStorage.person_file = 'local_storage/people.json'
  LocalStorage.rental_file = 'local_storage/rentals.json'

  ui = UserInterface.new

  LocalStorage.load_data(ui.app)

  ui.welcome_message

  loop do
    ui.ask_user_for_option
    next unless ui.valid_option?

    break if ui.exit_option?

    ui.evaluate_option
  end

  ui.exit_message

  LocalStorage.save_data(ui.app)
rescue Interrupt
  puts ''
  ui.exit_message
  exit 130
end

main
