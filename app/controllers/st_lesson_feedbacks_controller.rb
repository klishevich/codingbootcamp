class StLessonFeedbacksController < ApplicationController
  before_action :auth_student, except: [:index]
  before_action :auth_mentor_view, only: [:index]
  before_action :set_my_course_lesson_step, only: [:new, :create, :show]
  before_action :other_user, only: [:create]

  def index
    @feedbacks = StLessonFeedback.order(id: :desc).joins(:my_lesson).where("my_lessons.status = 0")
  end

  def new
    @feedback = StLessonFeedback.new
  end

  def create
    @feedback = @my_lesson.build_st_lesson_feedback(st_lesson_feedback_params)
    if @feedback.save
      flash[:notice] = t(:lesson_completed)
      redirect_to st_my_course_st_my_lesson_path(@my_course, @my_lesson)
    else
      render 'new'
    end
  end

  def show
    @feedback = @my_lesson.st_lesson_feedback
  end

  def st_lesson_feedback_params
    params.require(:st_lesson_feedback).permit(:grade,
                                               :grade_comment,
                                               :hw_done,
                                               :hw_link)
  end

  private

  def set_my_course_lesson_step
    @my_course = MyCourse.where(user_id: current_user.id).find(params[:st_my_course_id])
    @my_lesson = @my_course.my_lessons.find(params[:st_my_lesson_id])
    # for steps_sidebar_menu
    @my_steps = @my_lesson.my_steps.order(:id)
  end

  def other_user
    if current_user.id != @my_course.user.id
      flash[:notice] = t(:other_user)
      redirect_to root_path
    end
  end

end
