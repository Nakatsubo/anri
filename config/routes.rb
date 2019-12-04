Rails.application.routes.draw do
  # users
  resources :users, param: :name, path: '/', only: %i(show)
  # homes
  resources :homes
  # OAuth
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root
  root to: 'homes#index'
end
