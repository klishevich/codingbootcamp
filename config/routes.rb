Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get '/program_intro_to_web', to: 'static_pages#program_intro_to_web'
  get '/program_modern_javascript', to: 'static_pages#program_modern_javascript'
  get '/es6', to: 'static_pages#program_es6'
  get '/mentors', to: 'static_pages#mentors'
  get '/faq', to: 'static_pages#faq'
  get '/contacts', to: 'static_pages#contacts'
  get '/offer', to: 'static_pages#offer'
  get '/posts', to: 'static_pages#posts'
  get '/post_kak_stat_web_razrabotchikom', to: 'static_pages#post1'

  get '/corporate', to: 'static_pages#corporate'
  get '/instructor', to: 'static_pages#instructor'
  get '/partner', to: 'static_pages#partner'

  get '/profile', to: 'user_infos#profile'
  resources :user_infos, only: [:index, :edit, :update]

  resources :courses do
    resources :lessons do
      resources :steps
    end
  end

  resources :my_courses do
    resources :my_lessons
  end

  resources :st_my_courses, only: [:index, :show, :create] do
    resources :st_my_lessons, only: [:show] do
      resources :st_my_steps, only: [:show]
      resources :st_lesson_feedbacks, only: [:new, :create, :show]
    end
  end

  resources :st_lesson_feedbacks, only: [:index]

  # get '/st_my_courses/:id', to: 'st_my_courses#show', as: 'st_my_courses'

  resources :certificates

end
