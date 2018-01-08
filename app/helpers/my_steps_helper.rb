module MyStepsHelper
  def steps_sidebar_menu(my_course, my_lesson, my_steps, my_step_id)
    lesson_li_el = image_tag('icons8-information-64.png', height: '30px') +
      link_to('Описание урока', st_my_course_st_my_lesson_path(my_course, my_lesson))
    lesson_li_class = my_step_id == -1 ? 'bd-sidenav-active' : ''
    lesson_li = content_tag(:li, lesson_li_el, class: lesson_li_class)

    content_tag(:ul, class: 'nav bd-sidenav') do
      all_li = lesson_li
      my_steps.each do |s|
        step_li_el_img = case s.step.step_type_before_type_cast
        when Step.step_types[:video]
          image_tag('icons8-YouTube-64.png', height: '30px')
        when Step.step_types[:text]
          image_tag('icons8-OpenBook-64.png', height: '30px')
        end

        step_li_el = link_to(s.step.name, st_my_course_st_my_lesson_st_my_step_path(my_course, my_lesson, s))
        step_li_el = step_li_el_img + step_li_el if (step_li_el_img)
        step_li_class = my_step_id == s.id ? 'bd-sidenav-active' : ''
        step_li = content_tag(:li, step_li_el, class: step_li_class)

        all_li += step_li
      end
      all_li
    end
  end
end
