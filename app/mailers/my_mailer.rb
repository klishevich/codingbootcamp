class MyMailer < ApplicationMailer
  default from: 'info@codingbootcamp.ru'
  def new_registration(user)
    mail(to: 'info@codingbootcamp.ru',
         subject: 'New Registration Coding Bootcamp Ru',
         body: "User #{user.id},email #{user.email}, full_name #{user.full_name}, preferred_name #{user.preferred_name}, phone #{user.phone}, city #{user.city}, comment #{user.comment}")
  end

  def lesson_opened(user_email, lesson_name, lesson_url, user_name)
    name = user_name.blank? ? t(:dear_student) : user_name
    mail(to: user_email,
         subject: "#{t(:default_title)} - #{t(:new_lesson_is_opened)}",
         body: "#{name}!\n\n #{t(:new_lesson_is_opened)}: #{lesson_name} - #{lesson_url}\n\n Успехов в учебе, #{get_wish} Майкл")
  end

  private

  def get_wish
    EmailWish.order("RANDOM()").first.text
  end

end
