class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(flight_id: @flight.id, number_passengers: params[:number_passengers])
    params[:number_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    PassengerMailer.thank_you_email(@booking.passengers.first, @booking).deliver_now
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, :number_passengers,
                                      passengers_attributes: [:name, :email])
    end
end
