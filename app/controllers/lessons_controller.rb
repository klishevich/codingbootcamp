class LessonsController < ApplicationController
  before_action :auth_mentor_view, only: [:show]
  before_action :auth_mentor, except: [:show]
  before_action :set_course, only: [:create, :new, :edit, :update, :show]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      flash[:notice] = t(:created_successfuly)
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @lesson = @course.lessons.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to course_lesson_path(@course, @lesson)
    else
      render 'edit'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @steps = @lesson.steps.order(:id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name,
                                  :video_desc,
                                  :task_desc,
                                  :reading_desc,
                                  :comment_desc,
                                  :hint,
                                  :video_link)
  end

end
