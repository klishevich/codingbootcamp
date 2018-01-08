class StMyLessonsController < ApplicationController
  before_action :auth_student

  def show
    @my_course = MyCourse.where(user_id: current_user.id).find(params[:st_my_course_id])
    @my_lesson = @my_course.my_lessons.find(params[:id])
    @lesson = @my_lesson.lesson
    @my_steps = @my_lesson.my_steps

    # for steps_sidebar_menu
    @my_steps = @my_lesson.my_steps
    # hardcode for lesson first menu element
    @my_step_id = -1
  end
end
