require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:nyc_sfo)
  end

  test "should get new" do
    get new_booking_path(params: {flight_id: @flight.id, number_passengers: 2})
    assert_response :success
  end

  test "new should contain form with data" do
    get new_booking_path(params: {flight_id: @flight.id, number_passengers: 2})
    # data
    assert_match @flight.from_airport.code, response.body
    assert_match @flight.to_airport.code, response.body
    assert_match @flight.id.to_s, response.body
    # form
    assert_select 'form'
    assert_select 'input[type=text]', count: 4
    assert_select 'input[type=submit]'
  end

  test "create should create a booking and passengers" do
    assert_difference 'Booking.count', 1 do
      assert_difference 'Passenger.count', 2 do
        post bookings_path(params: { booking: {flight_id: @flight.id, number_passengers: 2,
                                        passengers_attributes: {
                                          '0' => {name: "abc", email: "efg" },
                                          '1' => {name: "zxc", email: "vbn" } }
                                      } })
      end
    end
  end
end
