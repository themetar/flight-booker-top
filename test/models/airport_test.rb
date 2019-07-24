require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = airports(:nyc)
  end

  test "relations to flights should work" do
    assert_equal flights(:nyc_sfo), @airport.departing_flights.first
    assert_equal flights(:sfo_nyc), @airport.arriving_flights.first
  end
end
