class PassengerMailer < ApplicationMailer
  default from: "noreply@example.com"

  def thank_you_email(passenger, booking)
    @passenger = passenger
    @booking = booking
    mail(to: passenger.email, subject: "You have booked your ticket")
  end
end
