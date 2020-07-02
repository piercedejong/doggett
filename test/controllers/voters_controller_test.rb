require 'test_helper'

class VotersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get voters_new_url
    assert_response :success
  end

  test "should get create" do
    get voters_create_url
    assert_response :success
  end

  test "should get update" do
    get voters_update_url
    assert_response :success
  end

end
