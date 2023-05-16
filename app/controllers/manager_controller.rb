class ManagerController < ApplicationController
  before_action :authenticate_user!
  before_action :manager

  def manager
    store = Store.find(params[:id])
    if current_user.id != store.user_id
      redirect_to root_url
    end
  end
end
