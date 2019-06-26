require 'test_helper'

class CreateCommentsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: "Test User", email: "user@test.com", password: "password")
    @donation = Donation.create(title: "Doação de teste", description: "Uma doação para o teste de unidade", street: "Rua do Matão", detail: "Bloco A, IME-USP", zip: "12345-123", phone: "11991929192", email: @user.email, user_id: @user.id)
    sign_in_as(@user, "password")
  end

  test "get new comment form and create new comment" do
    get new_comment_path
    assert_template 'comments/new'
    assert_difference 'Comment.count', 1 do
      post comments_path, params: {comment: {body: "Comentário do teste", user_id: @user.id, donation_id: 1 }}
      follow_redirect!
    end
    assert_template 'donations/show'
    assert_match "Comentário do teste", response.body
  end

  test "get edit form and update comment content" do
    @comment = Comment.create(body: "Comentário do teste", user_id: @user.id, donation_id: 1)
    get edit_comment_path(@comment)
    assert_template 'comments/edit'

    put comment_path(@comment), params: {comment: {body: "Comentário do teste modificado", user_id: @user.id, donation_id: 1 }}
    follow_redirect!
    assert_template 'donations/show'
    assert_match "Comentário do teste modificado", response.body
  end

  test "destroy a comment" do
    Comment.create(body: "Comentário do teste", user_id: @user.id, donation_id: 1)

    get comments_path
    assert_template 'comments/index'

    @comment = Comment.find_by_id(1);
    assert_difference 'Comment.count', -1 do
      delete comment_path(@comment)
      follow_redirect!
    end
    assert_template 'comments/index'
  end
end