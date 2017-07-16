require_relative 'lib/menu'

menu = Menu.new
input = nil

if menu.tickets.connection
  while (input != 'quit')
    menu.mainMenu

    input = gets.strip.downcase

    case input

    when "1"
      #shows all tickets, with 25 on each page
      menu.ticketList

    when "2"
      menu.singleTicket

    when "quit"
      #exit the program
      menu.quit

    else
      puts "--Invalid input!--"

    end

  end

else
  menu.connectionError

end
