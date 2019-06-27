require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "test@donation.com", password: "password", name: "Test User", admin: false)
    @donation = Donation.create(title: "Test donation", description: "A description for the test", street: "Test street", detail: "Apartment 10 of Block Test", zip: "12345-123", phone: "11912349123", email: "test@donation.com", user_id: 1)
  end

  test "donation should be valid" do
    assert @donation.valid?
  end

  test "title should be present" do
    @donation.title = ""
    assert_not @donation.valid?
  end

  test "description should be present" do
    @donation.description = ""
    assert_not @donation.valid?
  end

  test "phone should be present" do
    @donation.phone = ""
    assert_not @donation.valid?
  end

  test "email should be present" do
    @donation.email = ""
    assert_not @donation.valid?
  end

  test "phone format should be valid" do
    @donation.phone = "1234-1234"
    assert_not @donation.valid?
  end

  test "email format should be valid" do
    @donation.email = "email@"
    assert_not @donation.valid?
  end
end
