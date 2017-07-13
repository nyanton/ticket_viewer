require 'zendesk_api'
require 'logger'

class Ticket_handler
  attr_reader :total

  def initialize

    @client = ZendeskAPI::Client.new do |config|
      #url to connect to
      config.url = "https://orn.zendesk.com/api/v2"

      #authentication
      config.username = "anton.o@live.com.au"
      config.password = "APassword"

    end

    begin
      @total = @client.tickets.count!
      @connection = true
      
    rescue Exception => e
      @connection = false

    end

  end

  def connected?
    return @connection
  end

  def showTicket(ticketID)

    begin
      ticket = @client.tickets.find!(:id => ticketID)
      puts "---------------------------\n"
      puts "Ticket Subject:"
      puts "\t#{ticket[:subject]}"
      puts "Ticket Content:"
      puts"\t#{ticket[:description]}\n"
      puts "---------------------------\n"

    rescue Exception => e
      puts "---------------------------\n"
      puts "--Invalid Ticket ID!--"
      puts "---------------------------\n"

    end

  end

  def showPage(page)
    #takes the page number to be shown, and retrieves a summary of tickets.
    #will also return the next page and previous page?
    tickets = @client.tickets.page(page).per_page(25)
    first = tickets.first[:id]
    last = tickets.last[:id]

    puts "---------------------------\n"

    tickets.each do |ticket|
      puts "ID: #{ticket[:id]}"
      puts "\t#{ticket[:subject]}"
      puts "----------"

    end

    puts "---------------------------\n"
    puts "Showing tickets: #{first} - #{last} out of #{@total}"

  end


end
