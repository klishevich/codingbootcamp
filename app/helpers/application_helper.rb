module ApplicationHelper
  def change_locale_nav_item(locale, url)
    elClass = (I18n.locale == locale) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(locale.to_s.upcase, url, class: "nav-link"), class: elClass)
  end

  def page_nav_item(text, path)
    temp = current_page?(path)
    elClass = current_page?(path) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(text, path, class: "nav-link"), class: elClass)
  end

  def page_dropdown_item(text, path)
    elClass = current_page?(path) ? "dropdown-item active" : "dropdown-item"
    link_to(text, path, class: elClass)
  end

  def apply_now_button(large=false)
    cls = large ? 'btn btn-success btn-lg' : 'btn btn-success'
    if !user_signed_in?
      return link_to('Подать заявку', new_user_registration_path, role: 'button', class: cls)
    else
      return link_to(t(:my_data), users_profile_path, role: 'button', class: cls)
    end
  end

  def asset_url(asset)
    "#{request.protocol}#{request.host_with_port}#{asset_path(asset)}"
  end

  def show_youtube_embed(youtube_code)
    if youtube_code.blank?
      return nil
    else
      content_tag(:div, class: 'show-div') do
        content_tag(:div, class: 'embed-responsive embed-responsive-16by9') do
          content_tag(:iframe,
                      '',
                      src: "https://www.youtube.com/embed/#{youtube_code}",
                      width: 560,
                      height: 315,
                      frameborder: 0,
                      gesture: 'media',
                      allow: 'encrypted-media',
                      allowfullscreen: '')
        end
      end
    end
  end
end
