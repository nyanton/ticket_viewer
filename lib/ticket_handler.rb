require 'faraday'
require 'zendesk_api'

class Ticket_handler

  def initialize
    #@connection = Faraday.new(:url => "https://orn.zendesk.com/api/v2/tickets/")
    #@connection.basic_auth('anton.o@live.com.au', 'APassword')

    @client = ZendeskAPI::Client.new do |config|
      #url
      config.url = "https://orn.zendesk.com/api/v2"

      #authentication
      config.username = "anton.o@live.com.au"
      config.password = "APassword"

    end

  end

  def totalTickets
    total = 0

    @client.tickets.all do |ticket|
      total += 1
    end

    return total

  end

  def showTicket(ticketID)
    ticket = @client.tickets.find(:id => ticketID)

    unless ticket == nil
      puts "---------------------------\n"
      puts "Ticket Subject:"
      puts "\t#{ticket[:subject]}"
      puts "Ticket Content:"
      puts"\t#{ticket[:description]}\n"
      puts "---------------------------\n"
    else
      puts "Invalid Ticket ID"

    end

  end

  def showPage(page)
    #takes the page number to be shown, and retrieves a summary of tickets.
    #will also return the next page and previous page?

    tickets = @client.tickets.page(page).per_page(25)

    puts "---------------------------\n"
    tickets.each do |ticket|
      puts "ID: #{ticket[:id]}"
      puts "\t #{ticket[:subject]}"
      puts "----------"
    end
    puts "---------------------------\n"

  end

  def responseCheck(response)
    #used to check if response is within 200
    #if response is outside of range, then reply with error

    puts response.status

  end

end
