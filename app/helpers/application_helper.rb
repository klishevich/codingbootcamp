module ApplicationHelper
  def change_locale_nav_item(locale, url)
    elClass = (I18n.locale == locale) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(locale.to_s.upcase, url, class: "nav-link"), class: elClass)
  end

  def page_nav_item(text, path)
    temp = current_page?(path)
    # Rails.logger.info("temp #{temp}")
    elClass = current_page?(path) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(text, path, class: "nav-link"), class: elClass)
  end

  def page_dropdown_item(text, path)
    elClass = current_page?(path) ? "dropdown-item active" : "dropdown-item"
    link_to(text, path, class: elClass)
  end

  def apply_now_button(large=false)
    cls = large ? 'btn btn-success btn-lg' : 'btn btn-success'
    # Rails.logger.info("user_signed_in? #{user_signed_in?}")
    if !user_signed_in?
      return link_to('Подать заявку', new_user_registration_path, role: 'button', class: cls)
    else
      return link_to(t(:my_data), users_profile_path, role: 'button', class: cls)
    end
  end
end
