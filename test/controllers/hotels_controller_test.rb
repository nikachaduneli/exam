require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel = hotels(:one)
    @user = users(:user)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in_as @user
    get hotels_url
    assert_response :success
  end
  test "shouldn't get index" do
    get hotels_url
    assert_response :forbidden
  end

  test "should get new" do
    sign_in_as @admin
    get new_hotel_url
    assert_response :success
  end

  test "shouldn't get new" do
    sign_in_as @user
    get new_hotel_url
    assert_response :forbidden
  end

  test "should create hotel" do
    sign_in_as @admin
    assert_difference("Hotel.count") do
      post hotels_url, params: { hotel: { address: @hotel.address, name: @hotel.name } }
    end
    assert_redirected_to hotel_url(Hotel.last)
  end
  test "shouldn't create hotel" do
    sign_in_as @user
    post hotels_url, params: { hotel: { address: @hotel.address, name: @hotel.name } }
    assert_response :forbidden
  end

  test "should show hotel" do
    sign_in_as @user
    get hotel_url(@hotel)
    assert_response :success
  end
  test "shouldn't show hotel" do
    get hotel_url(@hotel)
    assert_response :forbidden
  end

  test "should get edit" do
    sign_in_as @admin
    p session[:user_id]
    get edit_hotel_url(@hotel)
    assert_response :success
  end

  test "shouldn't get edit" do
    sign_in_as @user
    get edit_hotel_url(@hotel)
    assert_response :forbidden
  end

  test "should update hotel" do
    sign_in_as @admin
    patch hotel_url(@hotel), params: { hotel: { address: @hotel.address, name: @hotel.name } }
    assert_redirected_to hotel_url(@hotel)
  end

  test "shouldn't update hotel" do
    sign_in_as @user
    patch hotel_url(@hotel), params: { hotel: { address: @hotel.address, name: @hotel.name } }
    assert_response :forbidden
  end

  test "should destroy hotel" do
    sign_in_as @admin
    assert_difference("Hotel.count", -1) do
      delete hotel_url(@hotel)
    end
    assert_redirected_to hotels_url
  end
  test "shouldn't destroy hotel" do
    sign_in_as @user
    assert_difference("Hotel.count", -1) do
      delete hotel_url(@hotel)
    end
    assert_response :forbidden
  end
end
