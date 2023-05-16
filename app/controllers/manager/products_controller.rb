class Manager::ProductsController < ApplicationController
  def index
  end

  def manager
    store = Store.find(params[:store_id])
    if current_user.id != store.user_id
      redirect_to root_url
    end
  end
end
