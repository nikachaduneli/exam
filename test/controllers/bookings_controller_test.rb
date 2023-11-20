require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    @user = users(:user)
    @user = User.create(username: "user12", email: "user123@example.com", password: "password", admin: false)
    @admin = User.create(username: "admin123", email: "admin123@example.com", password: "password", admin: true)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as @user
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    sign_in_as @admin
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { code: @booking.code, date_end: @booking.date_end, date_start: @booking.date_start, room_id: @booking.room_id, user_id: @booking.user_id } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { code: @booking.code, date_end: @booking.date_end, date_start: @booking.date_start, room_id: @booking.room_id, user_id: @booking.user_id, hotel_id: @booking.hotel_id } }
    assert_redirected_to booking_url(@booking)
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
