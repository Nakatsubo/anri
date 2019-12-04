Rails.application.routes.draw do
  # OAuth
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root
  root to: 'homes#index'
end
