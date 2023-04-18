Rails.application.routes.draw do
  devise_for :users

  get "contact" => "pages#contact"
  get "about" => "pages#about"
  get "help" => "pages#help"
  get "create_stor_info" => "pages#create_stor_info"
  get "cart/add" =>"cart#add"
  get "cart/delete" =>"cart#delete"
  get "cart/delete_all" => "cart#delete_all"
  get "cart/show" =>"cart#show"
  get "clear" => "cart#clear"

  resources :orders

  resources :stores do
    resources :products
  end

  resources :products, only: [:index]

   resources :users

  root "home#index"
end
