require 'test_helper'

class ReadingBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reading_books_new_url
    assert_response :success
  end

end
