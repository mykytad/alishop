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

  resources :payments, only: [] do
    # member do payments/:id/foo
    #   get "foo"
    # end
    collection do #payments/foo
      get "checkout"
      post "execute"
    end
  end

  resources :stores do
    resources :products
  end

  namespace :manager do
    resources :stores do
      resources :orders
      resources :products
    end

    resources :products, only: [:index]
  end

  resources :products, only: [:index]
  resources :users

  root "home#index"
end
