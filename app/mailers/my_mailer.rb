class MyMailer < ApplicationMailer
  default from: 'info@codingbootcamp.ru'
  def new_registration(user)
    mail(to: 'info@codingbootcamp.ru',
         subject: 'New Registration Coding Bootcamp Ru',
         body: "User #{user.id},email #{user.email}, full_name #{user.full_name}, preferred_name #{user.preferred_name}, phone #{user.phone}, city #{user.city}, comment #{user.comment}")
  end

  def lesson_opened(user_email, lesson_name, lesson_url)
    mail(to: user_email,
         subject: "#{t(:default_title)} - #{t(:new_lesson_is_opened)}",
         body: "#{t(:new_lesson_is_opened)}: #{lesson_name} - #{lesson_url}\n\n C любовью #{t(:default_title)}")
  end
end
