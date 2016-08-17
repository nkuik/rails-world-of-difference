Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root to: 'pages#home'

  resources :projects
  resources :applications
  resources :skill_users, only: [:new, :create, :destroy]
  resources :profiles


end
