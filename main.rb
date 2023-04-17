require_relative 'user_interface'

def main
  ui = UserInterface.new

  ui.welcome_message

  loop do
    ui.ask_user_for_option
    next unless ui.valid_option?

    break if ui.exit_option?

    ui.evaluate_option
  end

  ui.exit_message
rescue Interrupt
  puts ''
  ui.exit_message
  exit 130
end

main
