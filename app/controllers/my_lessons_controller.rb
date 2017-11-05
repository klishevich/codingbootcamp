class MyLessonsController < ApplicationController
  before_action :auth_mentor
  before_action :set_my_course, only: [:create, :new, :edit, :update, :show]

  def new
    @my_lesson = MyLesson.new(status: 0)
  end

  def create
    @my_lesson = @my_course.my_lessons.build(my_lesson_params)
    if @my_lesson.save
      flash[:notice] = t(:created_successfuly)
      redirect_to my_course_my_lesson_path(@my_course, @my_lesson)
    else
      render 'new'
    end
  end

  def edit
    @my_lesson = @my_course.my_lessons.find(params[:id])
  end

  def update
    @my_lesson = @my_course.my_lessons.find(params[:id])
    if @my_lesson.update_attributes(my_lesson_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to my_course_my_lesson_path(@my_course, @my_lesson)
    else
      render 'edit'
    end
  end

  def show
    @my_lesson = MyLesson.find(params[:id])
    @lesson = @my_lesson.lesson
  end

  def set_my_course
    @my_course = MyCourse.find(params[:my_course_id])
  end

  def my_lesson_params
    params.require(:my_lesson).permit(:lesson_id,
                                      :status,
                                      :date_start,
                                      :date_end,
                                      :grade,
                                      :comment_for_student,
                                      :comment)
  end
end
