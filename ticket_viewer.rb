#Main function

require_relative 'lib/menu'
require_relative 'lib/ticket_handler'

menu = Menu.new
tickets = Ticket_handler.new
input = nil

while (input != 'quit')
  menu.mainMenu

  input = gets.chomp

  case input

  when "1"
    menu.ticketList(tickets)

  when "2"

    menu.ticket
    input = gets.chomp

    ticket = tickets.showTicket(input)

  when "quit"
    break

  else
    puts "--Invalid input!--"

  end

end
