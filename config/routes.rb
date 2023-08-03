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

  resources :orders do
    collection do
      get "vue_table"
    end
  end

  resources :payments, only: [] do
    # member do payments/:id/foo
    #   get "foo"
    # end
    collection do #payments/foo
      get "checkout"
      get "successful"
      post "execute"
    end
  end

  resources :stores do
    resources :products do
      resources :reviews
    end
  end

  namespace :manager do
    resources :stores do
      resources :orders do
        collection do
          get "statistic"
        end
      end
      resources :products do
        collection do
          get "export"
          get "import"
          post "post_import"
        end
      end
    end

    resources :products, only: [:index]
  end

  resources :products, only: [:index]
  resources :users

  root "home#index"
end
