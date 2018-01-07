class StepsController < ApplicationController
  before_action :auth_mentor_view, only: [:show]
  before_action :auth_mentor, except: [:show]
  before_action :set_course, :set_lesson, only: [:create, :new, :edit, :update, :show]

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def new
    @step = Step.new
  end

  def create
    @step = @lesson.steps.build(step_params)
    if @step.save
      flash[:notice] = t(:created_successfuly)
      redirect_to course_lesson_path(@course, @lesson)
    else
      render 'new'
    end
  end

  def edit
    @step = @lesson.steps.find(params[:id])
  end

  def update
    @step = @lesson.steps.find(params[:id])
    if @step.update_attributes(step_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to course_lesson_path(@course, @lesson)
    else
      render 'edit'
    end
  end

  def show
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :video_link, :desc, :step_type)
  end
end
