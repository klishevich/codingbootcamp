require 'test_helper'

class MyLessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get my_lessons_edit_url
    assert_response :success
  end

  test "should get new" do
    get my_lessons_new_url
    assert_response :success
  end

  test "should get show" do
    get my_lessons_show_url
    assert_response :success
  end

end
