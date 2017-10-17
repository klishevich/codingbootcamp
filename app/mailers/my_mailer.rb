class MyMailer < ApplicationMailer
  def new_registration(user)
    mail(to: 'info@codingbootcamp.ru',
         subject: 'New Registration Coding Bootcamp',
         body: "User #{user.id},email #{user.email}, full_name #{user.full_name}, preferred_name #{user.preferred_name}, phone #{user.phone}, city #{user.city}, comment #{user.comment}")
  end
end
