# README

Flight Booker Project for The Odin Project

https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker


To add Action Mailer:
1) In Gemfile under group :development do, add:
    gem "letter_opener"
2) bundle install
3) In config/environments/development.rb add:
    config.action_mailer.delivery_method = :letter_opener
    config.action_mailer.perform_deliveries = true
4) Generate the mailer
    bin/rails generate mailer Passenger
5) In mailer, create function for the email you need and set up instance variables that you will need in the mailer view (ex. @url, @passenger, @booking)
    app/mailers/passenger_mailer.rb
6) Touch to create the .html.erb and .text.erb view files in the mailer view
    app/views/passenger_mailer/
7) Call the mailer from the relevant controller
    app/controllers/bookings_controller.rb
8) Preview the email templates by filling out the preview doc:
    /test/mailers/previews/passenger_mailer_preview.rb
    Access the preview at: http://localhost:3000/rails/mailers/passenger_mailer/booking_confirmation_email 
9) Call the mailer from rails console
    PassengerMailer.with(passenger: Passenger.first, booking: Booking.first).booking_confirmation_email.deliver_now
