require "test_helper"

class Admin::PostComentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_coments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_coments_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_coments_edit_url
    assert_response :success
  end
end
