class StMyCoursesController < ApplicationController
  before_action :auth_student

  def index
    @courses = MyCourse.where(user_id: current_user.id)
  end

  def show
    @course = MyCourse.where(user_id: current_user.id).find(params[:id])
    @lessons = @course.my_lessons.where.not(status: [:hold]).order(:lesson_id)
  end
end
