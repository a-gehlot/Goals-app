Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :user do
    resources :goals, except: [:show]
    resources :user_comments, only: [:new, :create]
  end

  resource :goals do
    resources :goal_comments, only: [:new, :create]
  end

  get '/goals', to: 'goals#homepage'

  root 'goals#homepage'
end
