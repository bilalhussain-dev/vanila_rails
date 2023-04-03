Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#index"
  get "about", to: "pages#about"

  resources :articles

  # Setting up User Signup / Login routes
  get "signup", to: "users#new"
  resources :users, except:[:new]

end
