class StMyCoursesController < ApplicationController
  before_action :auth_student

  def index
    @courses = MyCourse.where(user_id: current_user.id).order(:id)
  end

  def show
    @course = MyCourse.where(user_id: current_user.id).find(params[:id])
    @lessons = @course.my_lessons.where.not(status: [:hold]).order(:id)
  end

  def create
    @my_course = MyCourse.new
    @my_course.user_id = current_user.id
    course = Course.find_by(code: my_course_params[:comment])
    i_have_course = MyCourse.find_by(user_id: current_user.id, course_id: course.id)
    if i_have_course
      flash[:notice] = t(:already_have_course)
      redirect_to st_my_course_path i_have_course
    else
      @my_course.course_id = course.id
      @my_course.date_start = Date.today
      @my_course.free!
      if @my_course.save
        if course.lessons.first
          first_lesson_id = course.lessons.first.id
          my_lesson = @my_course.my_lessons.create(my_course_id: @my_course.id, lesson_id: first_lesson_id)
          my_lesson.active!
        end
        flash[:notice] = t(:course_opened)
        redirect_to st_my_course_path @my_course
      else
        flash[:notice] = t(:sorry)
        redirect_to root_path
      end
    end
  end

  private

  def my_course_params
    params.require(:my_course).permit(:comment)
  end
end
