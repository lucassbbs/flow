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
  patch "/steps", to: "steps#reorder"
  get "/setup", to: "pages#setup"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks, except: :index
  resources :clients
  resources :steps, except: [:show]
  # Defines the root path route ("/")
  # root "articles#index"
  patch '/tasks', to: 'tasks#index'
end
