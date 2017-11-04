require 'test_helper'

class StMyCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get st_my_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get st_my_courses_show_url
    assert_response :success
  end

end
