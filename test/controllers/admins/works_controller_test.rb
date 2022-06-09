require "test_helper"

class Admins::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_works_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_works_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_works_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_works_edit_url
    assert_response :success
  end
end
