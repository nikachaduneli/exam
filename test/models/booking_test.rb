require "test_helper"

class BookingTest < ActiveSupport::TestCase
  def setup
    @room = Room.first
    @hotel = @room.hotel
    @date_1 = Date.new(2022, 1, 1)
    @date_2 = Date.new(2022, 1, 2)
    @user = User.first

  end
  test "valid booking" do
    # booking = Booking.new(room: @room, hotel: @hotel, code: 'assdf', date_start: @date_1, date_end: @date_2, user: @user)
    # p booking
    # assert booking.valid?
  end
end
