class CoursesController < ApplicationController
  before_action :auth_mentor_view, only: [:index, :show]
  before_action :auth_mentor, except: [:index, :show]

  def index
    @courses = Course.all.order(:id)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = t(:created_successfuly)
      redirect_to course_path @course
    else
      render 'new'
    end
  end

  def edit
    @course=Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to course_path @course
    else
      render 'edit'
    end
  end

  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons.order(:id)
  end

  def destroy
    @course=Course.find(params[:id])
    @course.destroy
    flash[:notice] = t(:deleted_successfuly)
    redirect_to courses_index_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

end
