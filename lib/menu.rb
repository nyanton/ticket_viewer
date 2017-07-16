require_relative 'ticket_handler'

class Menu
  #This class mainly handles the displays that the user sees.
  attr_reader :tickets

  def initialize
    @tickets = Ticket_handler.new
    @tickets.startConnection
  end

  def mainMenu
    #menu that is displayed upon starting up the program, or after the user completes their task and returns back to the menu.
    puts "\nWelcome to Orn Inc. Ticket Viewer"
    puts "---------------------------"
    puts "\tEnter 1 to view all tickets"
    puts "\tEnter 2 to specify a ticket"
    puts "\tEnter \'quit\' to exit the program"
    puts "---------------------------"

  end

  def singleTicket
    #used for displaying text when user wants to search up a specific ticket
    puts "Please enter ticket id you would wish to look at:"

    input = gets.strip

    ticket = @tickets.showTicket(input)

    unless ticket == -1
      puts "---------------------------"
      puts "Ticket ID:        #{ticket[:id]}"
      puts "Ticket Status:    #{ticket[:status]}"
      puts "Ticket Subject:   #{ticket[:subject]}"
      puts "Ticket Content:"
      puts "#{ticket[:description]}"
      puts "---------------------------"

    else
      puts "---------------------------"
      puts "--Invalid Ticket ID!--"
      puts "---------------------------"

    end

  end

  def ticketList
    #Used for displaying all tickets, will only show 25 tickets at most at a time
    currentPage = 1
    input = nil

    #add the one because dividing a number would return one less than what we need.
    #eg, if we have 26 tickets, then 26/25 = 1, but we need two pages instead.
    #or if there are only 24 tickets, then 24/25 = 0, and we need one page.
    maxPage = ((@tickets.total)/25) + 1

    begin
      while (input != 'back')
        tickets = @tickets.showPage(currentPage)
        first = tickets.first[:id]
        last = tickets.last[:id]

        puts "---------------------------"

        tickets.each do |ticket|
          puts "ID:        #{ticket[:id]}"
          puts "Status:    #{ticket[:status]}"
          puts "Subject:   #{ticket[:subject]}"
          puts "------------"

        end

        puts "---------------------------"
        puts "Showing tickets: #{first} - #{last} out of #{@tickets.total}"
        puts "---------------------------"
        puts "Enter \'next\' for next page" unless currentPage == maxPage
        puts "Enter \'prev'\ for previous page" unless currentPage == 1
        puts "Enter \'back\' to return to the main menu"
        puts "---------------------------"

        input = gets.strip.downcase

        case input

        when "next"
          if(currentPage < maxPage)
            currentPage += 1

          else
            puts "--Already on last page!--"

          end

        when "prev"
          if currentPage > 1
            currentPage -= 1

          else
            puts "--Already on first page!--"

          end

        when "back"
          puts "--Returning to Main Menu--"

        else
          puts "--Invalid Input!--"

        end

      end

    rescue Exception => e
      #this exception would be reached if there was a connection problem, after having already connected to the API once.
      connectionError
    end

  end

  def connectionError
    puts "--There was a problem connecting to the API--"
    puts "--Please check your network connection, or try again later--"

  end

  def quit
    puts "--Exiting Ticket Viewer Application--"

  end

end
