require "test_helper"

class Public::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_comment_new_url
    assert_response :success
  end

  test "should get create" do
    get public_comment_create_url
    assert_response :success
  end

  test "should get index" do
    get public_comment_index_url
    assert_response :success
  end

  test "should get show" do
    get public_comment_show_url
    assert_response :success
  end
end
