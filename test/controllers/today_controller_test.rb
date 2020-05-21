require "test_helper"

class TodayControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test "can get #show" do
    get today_url
    assert_response :success
  end
end
