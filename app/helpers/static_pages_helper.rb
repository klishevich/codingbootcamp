module StaticPagesHelper
  def course_info(title, text)
    content_tag(:div, class: 'row') do
      content_tag(:div, content_tag(:b, "#{title}:"), class: 'col-lg-3') +
      content_tag(:div, text, class: 'col-lg-9')
    end
  end

  def codingbootcamp_site
    link_to 'www.codingbootcamp.ru', 'http://www.codingbootcamp.ru/'
  end

  def codingbootcamp_email(subject='')
    mailto = 'mailto:info@codingbootcamp.ru'
    mailto += "?subject=#{subject}" if (subject != '')
    link_to 'info@codingbootcamp.ru', mailto
  end

  def program_info_li(lesson, video, homework, reading)
    content_tag(:li) do
      list = content_tag(:ul) do
        content_tag(:li, image_tag('icons8-YouTube-64.png', height: '30px') + content_tag(:span, ' ' + video)) +
          content_tag(:li, image_tag('icons8-Home-64.png', height: '30px') + content_tag(:span, ' ' + homework)) +
          content_tag(:li, image_tag('icons8-OpenBook-64.png', height: '30px') + content_tag(:span, ' ' + reading))
      end
      content_tag(:b, lesson) + list
    end
  end
end
