require 'test_helper'

class RestoresControllerTest < ActionDispatch::IntegrationTest
  test "should get inex" do
    get restores_inex_url
    assert_response :success
  end

  test "should get new" do
    get restores_new_url
    assert_response :success
  end

  test "should get show" do
    get restores_show_url
    assert_response :success
  end

end
