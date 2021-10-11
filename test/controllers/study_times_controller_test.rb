require 'test_helper'

class StudyTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get study_times_new_url
    assert_response :success
  end

  test "should get create" do
    get study_times_create_url
    assert_response :success
  end

end
