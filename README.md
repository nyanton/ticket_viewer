# Ticket Viewer
This project is being completed for a code challenge posed by Zendesk, as part of the Software Engineering Internship interview process.

This program makes use of the zendesk_api gem. The zendesk_api is used to access the endpoints.

# Using the Ticket Viewer
Simply clone the repository, or download the zip file.  Then navigate to the folder via command line and then use `ruby ticket_viewer.rb`.  

As the program is started, it will attempt to connect to the API endpoint using basic authentication.  If a connection fails here, then the program terminates.  Failure would be due to no internet connection, or the authentication details have been altered.

The ticket viewer has two main functionalities:
* to show a list of tickets that belong to the account
* to show the contents of a specified ticket

To look at a list of the tickets, enter '**1**' from the main menu.  From there, a list of at most 25 tickets will be shown.  To navigate the list, enter '**next**' to go to the next page, or '**prev**' to go back a page.  The program handles these inputs if a user were to go to a previous page from the first page, or next page from the last page.  To return to the main menu, the user is to enter in '**back**'.  Each ticket will show their ID, Status, and Subject.

To look at a specific ticket, enter '**2**' from the main menu.  The program will then ask the user to enter the ID number of the ticket they would like to examine.  Once entered, the user will be presented with the ID, Status, Subject, and Content of the ticket.  The user will the be returned back to the main menu, regardless of whether the input is successful or not.

To exit the program, enter "**quit**" from the main menu.

# Testing
Simply run `rspec` from the root directory of the project.

### Current Issues with Testing
The tests currently have the issue of not correctly testing responses.  This is because the class that handles the API relies heavily on the zendesk_api client, and assumes that the client works.  As such, the tests will attempt to make a connection to the endpoint using basic authentication, and use actual tickets for the unit test.

# Assumptions
This program assumes that no new tickets will be added into the account while the program is in use.  Though it will be able to handle if tickets are added from a third party, it will not be able to create or delete tickets.

It also assumes that once a connection is made, the connection would not be broken while the application is in use.  In the case that the user loses connection and tries to specify a ticket number, they will receive an "_Invalid Ticket ID_" message.

# Project Details
* The program was run using ruby version 2.4.1.
* Tests were run using RSpec version 3.6.
