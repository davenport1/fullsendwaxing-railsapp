require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get unauthenticated redirect" do
    get admin_home_url
    assert_response :redirect
  end
end
