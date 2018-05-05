require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get flights_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get flights_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get flights_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get flights_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get flights_controller_destroy_url
    assert_response :success
  end

end
