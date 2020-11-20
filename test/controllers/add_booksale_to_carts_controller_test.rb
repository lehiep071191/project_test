require 'test_helper'

class AddBooksaleToCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get add_booksale_to_carts_update_url
    assert_response :success
  end

end
