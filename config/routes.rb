Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }   
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get 'home/index'
  devise_scope :user do
    get 'users/profile', to: 'users/registrations#show', as: 'user_profile'
    get 'users/comments', to: 'users/registrations#comments', as: 'comments_user'
    get 'users/edit', to: 'users/registrations#edit', as: 'edit_user_registration_profile'
    patch 'users', to: 'users/registrations#update'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
