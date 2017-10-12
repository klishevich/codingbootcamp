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

  def busation_email
    link_to 'info@busation.com', 'mailto:info@busation.com'
  end

  def program_info_li(lesson, video, homework, reading)
    content_tag(:li) do
      list = content_tag(:ul) do
        content_tag(:li,'(В). ' + video) +
            content_tag(:li,'(ДЗ). ' + homework) +
            content_tag(:li, '(Ч). ' +reading)
      end
      content_tag(:b, lesson) + list
    end
  end
end
