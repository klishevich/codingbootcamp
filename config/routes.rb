Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get '/courses', to: 'static_pages#courses'
  get '/program_intro_to_web', to: 'static_pages#program_intro_to_web'
  get '/program_web_developer', to: 'static_pages#program_web_developer'
  get '/program_modern_javascript', to: 'static_pages#program_modern_javascript'
  get '/mentors', to: 'static_pages#mentors'
  get '/faq', to: 'static_pages#faq'
  get '/contacts', to: 'static_pages#contacts'
  get '/offer', to: 'static_pages#offer'
  get '/posts', to: 'static_pages#posts'
  get '/post_kak_stat_web_razrabotchikom', to: 'static_pages#post1'

  get '/hiring_students', to: 'static_pages#hiring_students'
  get '/corporate_workshop', to: 'static_pages#corporate_workshop'
  get '/become_instructor', to: 'static_pages#become_instructor'
end
