Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "tasks#index", as: :authenticated_root
    end
    unauthenticated :user do
      root 'pages#home'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks, except: :index
  resources :clients
  # Defines the root path route ("/")
  # root "articles#index"
  patch '/tasks', to: 'tasks#index'
end
