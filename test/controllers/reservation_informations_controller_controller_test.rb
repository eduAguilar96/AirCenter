require 'test_helper'

class ReservationInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reservation_informations_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get reservation_informations_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get reservation_informations_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get reservation_informations_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reservation_informations_controller_destroy_url
    assert_response :success
  end

end
