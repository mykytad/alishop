Rails.application.routes.draw do
  devise_for :users

  get "contact" => "pages#contact"
  get "about" => "pages#about"
  get "help" => "pages#help"
  get "cart/add" =>"cart#add"
  get "cart/delete" =>"cart#delete"
  get "cart/delete_all" => "cart#delete_all"
  get "cart/show" =>"cart#show"
  get "checkout" => "order#create"


  resources :stores do
    resources :products
  end

  resources :products, only: [:index]

   resources :users

  root "home#index"
end
