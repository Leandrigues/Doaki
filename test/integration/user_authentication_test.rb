require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: "admin", email: "admin@doaki.com", password: "password", admin: true)
  end

  test "get login form and authenticate the user in session" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {email: "admin@doaki.com", password: "password", admin: true }
    assert logged_in?
    follow_redirect!
    assert_template 'users/show'
    assert_match @user.name, response.body
  end

  test "should logout user and go to root" do
    sign_in_as(@user, "password")
    delete logout_path
    follow_redirect!
    assert_not logged_in?
    assert_template 'pages/home'
  end
end