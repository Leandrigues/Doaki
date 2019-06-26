require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage index" do
    get about_path
    assert_response :success
  end

  test "should get root" do
    get root_path
    assert_response :success
  end
end
