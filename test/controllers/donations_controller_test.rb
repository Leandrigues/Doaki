require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "test@donation.com", password: "password", name: "Test User", admin: false)
    @donation = Donation.create(title: "Test donation", description: "A description for the test", street: "Test street", detail: "Apartment 10 of Block Test", zip: "12345-123", phone: "11912349123", email: "test@donation.com", user_id: 1)
  end

  test "should get index" do
    get donations_path
    assert_response :success
  end

  test "should get new donation form" do
    get new_donation_path
    assert_response :success
  end
  
  test "should get edit form" do
    get edit_donation_url(@donation)
    assert_response :success
  end

  test "should get show" do
    get donation_path(@donation)
    assert_response :success
  end
end
