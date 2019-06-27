require 'test_helper'

class DonationCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "test@donation.com", password: "password", name: "Test User", admin: false)
  end

  test "should create a new donation" do
    sign_in_as(@user, "password")
    get new_donation_path
    assert_template 'donations/new'
    assert_difference 'Donation.count', 1 do
      post donations_path, params: {donation: { title: "Test donation", description: "A description for the test", street: "Test street", detail: "Apartment 10 of Block Test", zip: "12345-123", phone: "11912349123", email: "test@donation.com", user_id: 1 } }
      follow_redirect!
    end
    assert_template 'donations/show'
    assert_match "Test donation", response.body
  end

  test "should edit an existent donation" do
    sign_in_as(@user, "password")
    @donation = Donation.create(title: "Test donation", description: "A description for the test", street: "Test street", detail: "Apartment 10 of Block Test", zip: "12345-123", phone: "11912349123", email: "test@donation.com", user_id: 1)
    get edit_donation_path(@donation)
    assert_template 'donations/edit'
    put donation_path(@donation), params:{ donation: { title: "Modified donation" } }
    follow_redirect!
    assert_template 'donations/show'
    assert_match "Modified donation", response.body
    assert_match @donation.description, response.body
  end

  test "should delete an existent donation" do
    sign_in_as(@user, "password")
    @donation = Donation.create(title: "Test donation", description: "A description for the test", street: "Test street", detail: "Apartment 10 of Block Test", zip: "12345-123", phone: "11912349123", email: "test@donation.com", user_id: 1)
    assert_difference 'Donation.count', -1 do
      delete donation_path(@donation)
    end
    assert_redirected_to donations_path
  end
end