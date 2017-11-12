module MyLessonsHelper
  def short_info(text)
    if text.blank?
      return ''
    elsif text.length <= 20
      return text
    else
      return "#{text[0..20]} ..."
    end
  end

  def show_div_not_blank(label, value)
    if value.blank?
      return nil
    else
      content_tag(:div, class: 'show-div') do
        content_tag(:div, content_tag(:b, label)) +
        content_tag(:div, value)
      end
    end
  end
end
