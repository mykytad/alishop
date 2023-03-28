Rails.application.routes.draw do
  devise_for :users

  get "contact" => "pages#contact"
  get "about" => "pages#about"
  get "help" => "pages#help"

  resources :stores do
    resources :products
  end

  resources :products, only: [:index]

   resources :users

  root "home#index"
end
