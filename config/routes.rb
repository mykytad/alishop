Rails.application.routes.draw do
  root "stores#index"
  devise_for :users
  # get "products/:id" => "products#show"
  # get "new" => "products#new"
  get "contact" => "pages#contact"
  get "about" => "pages#about"
  get "help" => "pages#help"

  resources :stores

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
