require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  def setup
    @one = bookings(:one)
    @two = bookings(:two)
  end

  test "relations to flights should work" do
    assert_equal @one.flight, flights(:sfo_nyc)
    assert_equal @two.flight, flights(:sfo_nyc)
  end

  test "relations to passengers should work" do
    assert_equal @one.passengers.count, 1
    assert_equal @two.passengers.count, 2
  end
end
