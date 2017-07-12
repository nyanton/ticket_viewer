require 'faraday'
require 'json'

class Ticket_handler

  def initialize
    @conn = Faraday.new(:url => "https://orn.zendesk.com/api/v2/tickets/")
    @conn.basic_auth('anton.o@live.com.au', 'APassword')
  end

  def show_ticket(ticketID)
    #takes in the id of a ticket, and then retrieves the json from the respective url.
    ticket = @conn.get "#{ticketID}.json"
    puts ticket.status
    json_ticket = JSON.parse(ticket.body)
    puts json_ticket["ticket"]["id"]
    puts json_ticket["ticket"]["subject"]
  end

  def show_page(page)
    #takes the page number to be shown, and retrieves a summary of tickets.
    #will also return the next page and previous page?
  end

end

blah = Ticket_handler.new
blah.show_ticket(1)
