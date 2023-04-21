class Meneger::StoresController < ApplicationController

  def index
    @stores = Store.where(:user_id => current_user.id)
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    
    redirect_to meneger_stores_path
  end
end
