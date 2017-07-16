require 'ticket_handler'

tickets = Ticket_handler.new
tickets.startConnection

noTickets = Ticket_handler.new

describe "Ticket Handler" do

  context "when a successful connection is made" do

    context "when searching for a single ticket" do
      it "is able to get a ticket by ID" do
        expect(tickets.showTicket(1)[:id]).to eq(1)
        expect(tickets.showTicket(1)[:subject]).to eq("Sample ticket: Meet the ticket")

      end

      it "shows an error for an invalid ticket ID" do
        expect(tickets.showTicket(999999999)).to eq(-1)

      end

      it "shows an error if user inputs letters into the search" do
        expect(tickets.showTicket("This is my ticket")).to eq(-1)

      end

    end

    context "when looking at a list of tickets" do
      it "retrieves a list of 25 tickets at most in a list" do
        page = tickets.showPage(1)
        total = 0

        #unable to call count on page, so manually counting tickets using a block
        page.each do
          total += 1
        end

        expect(total).to be <= 25
      end

    end

  end

  context "when a connection fails" do
    it "returns an error message when trying to find a ticket" do
      expect(noTickets.showTicket(1)).to eq(-1)

    end

  end

end
