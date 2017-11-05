module MyLessonsHelper
  def short_info(text)
    if text.blank?
      return ''
    elsif text.length <= 10
      return text
    else
      return "#{text[0..10]} ..."
    end
  end
end
