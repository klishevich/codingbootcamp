class MyCoursesController < ApplicationController
  before_action :auth_mentor_view, only: [:index, :show]
  before_action :auth_mentor, except: [:index, :show]

  def index
    @courses = MyCourse.all.order(:id)
  end

  def new
    @course = MyCourse.new(status: 0)
  end

  def create
    @course = MyCourse.new(my_course_params)
    if @course.save
      flash[:notice] = t(:created_successfuly)
      redirect_to my_course_path @course
    else
      render 'new'
    end
  end

  def edit
    @course = MyCourse.find(params[:id])
  end

  def update
    @course = MyCourse.find(params[:id])
    if @course.update_attributes(my_course_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to my_course_path @course
    else
      render 'edit'
    end
  end

  def show
    @course = MyCourse.find(params[:id])
    @lessons = @course.my_lessons.order(:id)
  end

  def destroy
    @course = MyCourse.find(params[:id])
    @course.destroy
    flash[:notice] = t(:deleted_successfuly)
    redirect_to my_courses_index_path
  end

  private

  def my_course_params
    params.require(:my_course).permit(:user_id,
                                      :course_id,
                                      :status,
                                      :ref,
                                      :date_start,
                                      :date_end,
                                      :grade,
                                      :comment_for_student,
                                      :comment)
  end
end
