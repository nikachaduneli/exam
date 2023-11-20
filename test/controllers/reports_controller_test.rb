require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
    @admin = users(:admin)
  end

  test "should get report" do
    sign_in_as @user
    get booking_reports_url
    assert_response :success
  end

end
