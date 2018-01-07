class StMyLessonsController < ApplicationController
  before_action :auth_student

  def show
    @my_course = MyCourse.where(user_id: current_user.id).find(params[:st_my_course_id])
    @my_lesson = @my_course.my_lessons.find(params[:id])
    @lesson = @my_lesson.lesson
    @my_steps = @my_lesson.my_steps
    @steps_sidebar_menu = get_steps_sidebar_menu
  end

  private

  def get_steps_sidebar_menu
    steps_sidebar_menu = [
      {
        name: 'Описание урока',
        link: st_my_course_st_my_lesson_path(@my_course, @my_lesson),
        img_type: 'info',
        active: true
      }
    ];

    step_items = @my_steps.map do |s|
      {
        name: s.step.name,
        link: st_my_course_st_my_lesson_st_my_step_path(@my_course, @my_lesson, s),
        img_type: s.step.step_type
      }
    end

    steps_sidebar_menu.push *step_items
  end
end
