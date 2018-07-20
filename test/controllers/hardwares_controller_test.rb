require 'test_helper'

class HardwaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hardwares_index_url
    assert_response :success
  end

  test "should get create" do
    get hardwares_create_url
    assert_response :success
  end

  test "should get destroy" do
    get hardwares_destroy_url
    assert_response :success
  end

end
