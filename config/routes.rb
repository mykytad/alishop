Rails.application.routes.draw do
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'
  get 'help' => 'pages#help'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
