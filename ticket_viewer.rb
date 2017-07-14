require_relative 'lib/menu'
require_relative 'lib/ticket_handler'

menu = Menu.new
tickets = Ticket_handler.new
input = nil

if tickets.connection
  while (input != 'quit')
    menu.mainMenu

    input = gets.chomp.downcase

    case input

    when "1"
      #shows all tickets, with 25 on each page
      menu.ticketList(tickets)

    when "2"
      menu.ticket
      input = gets.chomp
      #shows an individual ticket
      ticket = tickets.showTicket(input)

    when "quit"
      #exit the program
      menu.quit

    else
      puts "--Invalid input!--"

    end

  end

else
  puts "--There was a problem connecting to the API--"
  puts "--Please check your network connection, or try again later--"
  
end
