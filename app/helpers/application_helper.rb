module ApplicationHelper
  def change_locale_nav_item(locale, url)
    elClass = (I18n.locale == locale) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(locale.to_s.upcase, url, class: "nav-link"), class: elClass)
  end

  def page_nav_item(text, path)
    elClass = current_page?(path) ? "nav-item active" : "nav-item"
    content_tag(:li, link_to(text, path, class: "nav-link"), class: elClass)
  end

  def page_dropdown_item(text, path)
    elClass = current_page?(path) ? "dropdown-item active" : "dropdown-item"
    link_to(text, path, class: elClass)
  end
end
