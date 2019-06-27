require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: "admin", email: "admin@doaki.com", password: "password", admin: true)
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user2 = User.create(name: "admin2", email: "admin@doaki.com", password: "password2", admin: false)
    assert_not @user2.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user2 = User.create(name: "admin2", email: "admin@doaki.com", admin: false)
    assert_not @user2.valid?
  end

  test "password should not be too short" do
    @user.password = "aa"
    assert_not @user.valid?
  end

  test "password should not be too long" do
    @user.password = "a" * 50
    assert_not @user.valid?
  end
end
