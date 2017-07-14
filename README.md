# Ticket Viewer
This project is being completed for a code challenge posed by Zendesk, as part of the Software Engineering Internship interview process.

This program makes use of the zendesk_api gem. The zendesk_api is used to access the endpoints.

# Using the Ticket Viewer
Simply clone the repository, and then use `ruby ticket_viewer.rb`.  

As the program is started, it will attempt to connect to the API endpoint using basic authentication.  If a connection fails here, then the program terminates.

The ticket viewer has two main functionalities: to show a list of tickets that belong to the account, and to show the contents of a specified ticket.

To look at a list of the tickets, enter '**1**' from the main menu.  From there, a list of at most 25 tickets will be shown.  To navigate the list, enter '**next**' to go to the next page, or '**prev**' to go back a page.  The program handles these inputs if a user were to go to a previous page from the first page, or next page from the last page.  To return to the main menu, the user is to enter in '**back**'.  Each ticket will show their ID, Status, and Subject.

To look at a specific ticket, enter '**2**' from the main menu.  The program will then ask the user to enter the ID number of the ticket they would like to examine.  Once entered, the user will be presented with the ID, Status, Subject, and Content of the ticket.  The user will the be returned back to the main menu, regardless of whether the input is successful or not.

To exit the program, enter "**quit**" from the main menu.


# Assumptions
This program assumes that no new tickets will be added into the account while the program is in use.  Though it will be able to handle if tickets are added from a third party, it will not be able to create or delete tickets.

It also assumes that once a connection is made, the connection would not be broken while the application is in use.  In the case that the user loses connection and tries to specify a ticket number, they will receive an "_Invalid Output_" message

### TO DO
* Tests
