require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test User", email: "user@test.com", password: "password", admin: false)
  end

  test "should get signup form" do
    get signup_path
    assert_response :success
  end
  
  test "should get users index" do
    sign_in_as(@user, "password")
    get users_path
    assert_response :success
  end

  test "should get edit user form" do
    sign_in_as(@user, "password")
    get edit_user_path(@user)
    assert_response :success
  end

  test "should get user show" do
    get user_path (@user)
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: { email: @user.email, password: 'secret', password_confirmation: 'secret' } }
  #   end
  #   assert_redirected_to user_url(User.last)
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { email: @user.email, password: 'secret', password_confirmation: 'secret' } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end
  #   assert_redirected_to users_url
  # end
end
