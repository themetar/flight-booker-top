require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = flights(:sfo_nyc)
  end

  test "relations to airports should work" do
    assert_equal @flight.from_airport.class, Airport
    assert_equal @flight.to_airport.class, Airport
    assert_equal @flight.from_airport, airports(:sfo)
    assert_equal @flight.to_airport, airports(:nyc)
  end
end
