Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get '/courses', to: 'static_pages#courses'
  get '/mentors', to: 'static_pages#mentors'
  get '/faq', to: 'static_pages#faq'
  get '/contacts', to: 'static_pages#contacts'

  get '/hiring_students', to: 'static_pages#hiring_students'
  get '/corporate_workshop', to: 'static_pages#corporate_workshop'
  get '/become_instructor', to: 'static_pages#become_instructor'
end
