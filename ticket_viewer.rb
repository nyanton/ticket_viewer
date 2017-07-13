require_relative 'lib/menu'
require_relative 'lib/ticket_handler'

menu = Menu.new
tickets = Ticket_handler.new
input = nil

if tickets.connected?
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
      puts "--Exiting Ticket Viewer Application--"

    else
      puts "--Invalid input!--"

    end

  end

else
  puts "--There was a problem connecting to the API--"
  puts "--Please check your network connection, or try again later--"
end
