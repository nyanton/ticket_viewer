class Menu

  def initialize
  end

  def mainMenu

    puts "\nWelcome to Orn Inc. Ticket Viewer"
    puts "---------------------------\n"
    puts "\tEnter 1 to view all tickets"
    puts "\tEnter 2 to specify a ticket"
    puts "\tEnter \'quit\' to exit the program"
    puts "---------------------------\n"

  end

  def ticket

    puts "Please enter ticket id you would wish to look at"

  end

  def ticketList(tickets)
    currentPage = 1
    input = nil
    maxPage = ((tickets.totalTickets)/25) + 1

    while (input != 'back')

      tickets.showPage(currentPage)

      puts "---------------------------\n"
      puts "Enter \'next\' for next page" unless currentPage == maxPage
      puts "Enter \'prev'\ for previous page" unless currentPage == 1
      puts "Enter \'back\' to return to the main menu"
      puts "---------------------------\n"
      input = gets.chomp

      if (input == "next" and currentPage < maxPage)
        currentPage += 1
      elsif (input == "prev" and currentPage > 1)
        currentPage -= 1
      end

    end

  end

end
