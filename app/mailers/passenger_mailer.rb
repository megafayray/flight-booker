class PassengerMailer < ApplicationMailer
  default from: "no-reply@fay.com"

  def booking_confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @url = bookings_url(@booking)
    mail(to: @passenger.email, subject: "You have booked a flight!")
  end
end
