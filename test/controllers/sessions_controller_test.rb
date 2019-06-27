require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login form" do
    get login_path
    assert_response :success
  end
end
