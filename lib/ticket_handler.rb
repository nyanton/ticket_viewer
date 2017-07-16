require 'zendesk_api'

class Ticket_handler
  attr_reader :total, :connection

  def initialize
  end

  def startConnection
    #@client is used for connection and communicating with the API endpoint
    @client = ZendeskAPI::Client.new do |config|
      #url to connect to
      config.url = "https://orn.zendesk.com/api/v2"

      #authentication
      config.username = "anton.o@live.com.au"
      config.password = "APassword"

    end

    begin
      #gets the total amount of tickets, but is also used to check the connection
      #get the total amount of tickets now, because the method has a long load time
      @total = @client.tickets.count!
      @connection = true

    rescue Exception => e
      @connection = false

    end
  end

  def showTicket(ticketID)

    begin
      ticket = @client.tickets.find!(:id => ticketID)

      return ticket

    rescue Exception => e
      return -1

    end

  end

  def showPage(page)
    #takes the page number to be shown, and retrieves a summary of tickets.
    #will only show 25 tickets at a time as per specification

      tickets = @client.tickets.page(page).per_page(25)

      return tickets

  end


end
