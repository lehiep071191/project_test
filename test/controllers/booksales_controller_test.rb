require 'test_helper'

class BooksalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get booksales_index_url
    assert_response :success
  end

  test "should get show" do
    get booksales_show_url
    assert_response :success
  end

end
