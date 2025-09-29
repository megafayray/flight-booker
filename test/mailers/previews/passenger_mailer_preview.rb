# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def booking_confirmation_email
    booking = Booking.first
    passenger = booking.passengers.first
    
    PassengerMailer.with(passenger: passenger, booking: booking).booking_confirmation_email
  end
end
