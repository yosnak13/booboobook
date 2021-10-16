require 'test_helper'

class FirstRegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get first_registrations_new_url
    assert_response :success
  end

end
