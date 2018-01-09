class StMyStepsController < ApplicationController
  before_action :auth_student

  def show
    @my_course = MyCourse.where(user_id: current_user.id).find(params[:st_my_course_id])
    @my_lesson = @my_course.my_lessons.find(params[:st_my_lesson_id])
    @lesson = @my_lesson.lesson
    @my_step = @my_lesson.my_steps.find(params[:id])
    @step = @my_step.step

    # for steps_sidebar_menu
    @my_steps = @my_lesson.my_steps.order(:id)
    @my_step_id = params[:id].to_i
  end
end
