class FlightsController < ApplicationController
  def index
    @all_flights = Flight.all
    
    @flights = Flight.all

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end
  
    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end
  
    if params[:start_date].present?
      @flights = @flights.where(start_date: params[:start_date])
    end
  
    @passengers = params[:passengers].to_i if params[:passengers].present?
  end
end
