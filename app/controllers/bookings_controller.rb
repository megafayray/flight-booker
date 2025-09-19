class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)

    @passengers = params[:passengers].to_i

    @passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [:name, :email]
    )
  end
end