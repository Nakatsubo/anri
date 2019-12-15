Rails.application.routes.draw do
  # コメントアウトは最終的に整理しておくこと
  # retweets
  resources :retweets, only: %i(create)
  # tweets
  resources :tweets, only: %i(create show)
  # photos
  resources :photos, only: %i(create)
  # users
  resources :users, param: :name, path: '/', only: %i(show)
  # homes
  resources :homes, only: %i(index) do
    collection do
      get :about
      get :terms
      get :privacy
    end
  end
  # OAuth
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root
  root to: 'homes#index'
end
