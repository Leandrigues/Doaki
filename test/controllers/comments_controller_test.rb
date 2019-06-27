require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: "Test User", email: "user@test.com", password: "password")
    @donation = Donation.create(title: "Doação de teste", description: "Uma doação para o teste de unidade", street: "Rua do Matão", detail: "Bloco A, IME-USP", zip: "12345-123", phone: "11991929192", email: @user.email, user_id: @user.id)
    @comment = Comment.create(body: "Comentário do teste", user_id: @user.id, donation_id: 1)
  end

  test "should get comments index" do
    sign_in_as(@user, "password")
    get comments_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_comment_path
    assert_response :success
  end
  
  test "should get edit" do
    sign_in_as(@user, "password")
    get edit_comment_path(@comment)
    assert_response :success
  end

  test "should show comment" do
    get comment_path(@comment)
    assert_response :success
  end
end
