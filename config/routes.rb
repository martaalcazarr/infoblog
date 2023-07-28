Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }   
  resources :posts
  get 'home/index'
  
  devise_scope :user do
    get 'users/comments', to: 'users/registrations#comments', as: 'comments_user'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
