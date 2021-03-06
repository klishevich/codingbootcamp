class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    # Pass course_code from url
    resource[:code] = params[:code]
    respond_with resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      # Added admin notification for new registartion
      # MyMailer.new_registration(resource).deliver_now
      # Open Course if course_code provided
      my_course_path = open_course_by_code(resource.id, resource.code)
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        if (my_course_path)
          redirect_to my_course_path
        else
          respond_with resource, location: after_sign_up_path_for(resource)
        end
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  # Open Course
  def open_course_by_code(user_id, course_code)
    course = Course.find_by(code: course_code)
    if course
      start_course_date = Date.today
      my_course = MyCourse.create(user_id: user_id, course_id: course.id, date_start: start_course_date)
      my_course.free!
      if course.lessons.first
        create_my_lesson_with_steps(course.lessons.first, my_course)
      end
      if course.lessons.second
        create_my_lesson_with_steps(course.lessons.second, my_course)
      end
      return st_my_course_path(my_course)
    end
    return nil
  end

  def create_my_lesson_with_steps(lesson, my_course)
    my_lesson = my_course.my_lessons.create(my_course_id: my_course.id, lesson_id: lesson.id)
    my_lesson.active!
    lesson.steps.each do |s|
      MyStep.create(my_lesson: my_lesson, step: s)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
