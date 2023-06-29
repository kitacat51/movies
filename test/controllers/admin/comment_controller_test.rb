require "test_helper"

class Admin::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_comment_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_comment_create_url
    assert_response :success
  end

  test "should get index" do
    get admin_comment_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_comment_show_url
    assert_response :success
  end
end
