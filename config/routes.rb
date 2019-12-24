Rails.application.routes.draw do
  resources :searchs, only: %i(index create)
  resources :favorites, only: %i(create destroy)
  resources :replys, only: %i(create destroy)
  resources :retweets, only: %i(create)
  resources :tweets, only: %i(show create destroy)
  resources :photos, only: %i(create)
  resources :users, param: :name, path: '/', only: %i(show)
  resources :homes, only: %i(index) do
    collection do
      get :about
      get :terms
      get :privacy
    end
  end
  get 'users/sign_in', to: 'homes#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'homes#index'
  get '*anything', to: 'errors#routing_error'
end
