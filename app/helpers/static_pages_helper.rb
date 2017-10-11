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
end
