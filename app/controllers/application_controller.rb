class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def current_action?(names)
    names.include?(params[:action]) unless params[:action].blank? || false
  end
  helper_method :current_action?

  def auth_admin
    if !current_user&.is_admin?
      flash[:notice] = t(:you_are_not_admin)
      redirect_to '/'
    end
  end

  def auth_mentor_view
    if !current_user&.mentor?
      Rails.logger.info("current_user&.mentor? #{current_user&.mentor?}")
      flash[:notice] = t(:you_are_not_mentor_view)
      redirect_to '/'
    end
  end

  def auth_mentor
    if !current_user&.is_mentor?
      flash[:notice] = t(:you_are_not_mentor)
      redirect_to '/'
    end
  end

  def auth_student
    if !current_user&.is_student?
      flash[:notice] = t(:you_are_not_student)
      redirect_to '/'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,
                                                       :preferred_name,
                                                       :phone,
                                                       :city,
                                                       :comment,
                                                       :code])
  end
  
end
