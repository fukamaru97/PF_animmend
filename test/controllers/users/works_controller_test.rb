require "test_helper"

class Users::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_works_index_url
    assert_response :success
  end

  test "should get show" do
    get users_works_show_url
    assert_response :success
  end
end
