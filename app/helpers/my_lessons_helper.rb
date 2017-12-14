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

  def link_to_last_lesson(my_course)
    lesson_name = my_course.my_lessons.last&.lesson&.name
    if !lesson_name
      return nil
    else
      my_course_id = my_course.id
      my_lesson_id = my_course.my_lessons.last.id
      return link_to lesson_name, my_course_my_lesson_path(my_course_id, my_lesson_id)
    end
  end
end
