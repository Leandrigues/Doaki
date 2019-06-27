require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "should signup an user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Test User", email: "user@test.com", password: "password", admin: false } }
      follow_redirect!
    end
    assert_template 'users/show'
    assert_match "Test User", response.body
  end

  test "should update user information" do
    @user = User.create(name: "Test User", email: "user@test.com", password: "password", admin: false)
    get edit_user_path(@user)
    assert_template 'users/edit'
    put user_path(@user), params: { user: { name: "Modified User", password: "password" } }
    follow_redirect!
    assert_template 'users/show'
    assert_match "Modified User", response.body
    assert_match @user.email, response.body
  end

  test "should delete user" do
    @user = User.create(name: "Admin User", email: "admin@doaki.com", password: "password", admin: true)
    @user2 = User.create(name: "Test User", email: "test@doaki.com", password: "password", admin: false)
    sign_in_as(@user, "password")
    get users_path
    assert 'users/index'
    assert_match @user2.email, response.body
    delete user_path(@user2)
    follow_redirect!
    assert_template 'users/index'
    assert_no_match @user2.email, response.body
  end
end