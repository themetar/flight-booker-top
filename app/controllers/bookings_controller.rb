class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(flight_id: @flight.id, number_passengers: params[:number_passengers])
    params[:number_passengers].to_i.times { @booking.passengers.build }
  end

  def show
  end
end
