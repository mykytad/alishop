class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id

    if @store.save
      redirect_to manager_store_orders_path(@store.id)
    else
      return render(:new, status: :unprocessable_entity)
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :phone)
  end
end
