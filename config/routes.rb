Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root "home#index"
  resources :users, only: :show
  resources :profiles, only: [:edit, :update]
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
end
