require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    @one = passengers(:one)
  end

  test "relations to booking should work" do
    assert_equal @one.booking, bookings(:one)
  end
end
