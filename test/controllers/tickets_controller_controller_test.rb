require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tickets_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get tickets_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get tickets_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get tickets_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tickets_controller_destroy_url
    assert_response :success
  end

end
