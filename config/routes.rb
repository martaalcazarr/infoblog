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
  end
  devise_scope :user do
    get 'users/comments', to: 'users/registrations#comments', as: 'comments_user'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
